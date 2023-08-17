import 'package:learningdart/services/auth/auth_exceptions.dart';
import 'package:learningdart/services/auth/auth_provider.dart';
import 'package:learningdart/services/auth/auth_user.dart';
import 'package:test/test.dart';

void main() {
  group('Mock Authentication', () {
    final provider = MockAuthProvider();
    test('should not be initialized to begin with', () {
      expect(provider.initialized, false);
    });
    test('cannot log out if not initialized', () {
      expect(provider.logOut(),
          throwsA(const TypeMatcher<NotInitialisedException>()));
    });

    test('should be initilized', () async {
      await provider.initialize();
      expect(provider.initialized, true);
    });
    test('User shoud be null after initialization', () {
      expect(provider.currentUser, null);
    });
    test(
      'Should be able to initialize in less than 2 seconds',
      () async {
        await provider.initialize();
        expect(provider.initialized, true);
      },
      timeout: const Timeout(
        Duration(seconds: 4),
      ),
    );
    test('Create user should delegate to logIn function', () async {
      final badEmailUser = provider.createUser(
        email: 'badEmail@gmail.com',
        password: 'password',
      );
      expect(badEmailUser,
          throwsA(const TypeMatcher<UserNotFoundAuthException>()));

      // You don't have to put await because this instansatiation will cause an error in runtime, so we can't wait for it

      final badPasswordUser = provider.createUser(
        email: 'email@gmail.com',
        password: 'badPassword',
      );
      expect(badPasswordUser,
          throwsA(const TypeMatcher<WrongPasswordAuthException>()));

      final user = await provider.createUser(
        email: 'email@gmail.com',
        password: 'password',
      );
      expect(provider.currentUser, user);
      expect(user.isEmailVerified, false);
    });
    test('the user shoud be able to get verified', () async {
      await provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerified, true);
    });
    test('Should be able to log out and log in agian', () async {
      await provider.logOut();
      await provider.logIn(
        email: 'email@gmail.com',
        password: 'password',
      );
      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

class NotInitialisedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _initialized = false;
  bool get initialized => _initialized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!_initialized) throw NotInitialisedException();
    await Future.delayed(const Duration(seconds: 3));
    return await logIn(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    _initialized = true;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    if (!_initialized) throw NotInitialisedException();
    if (email == 'badEmail@gmail.com') throw UserNotFoundAuthException();
    if (password == 'badPassword') throw WrongPasswordAuthException();
    const user = AuthUser(isEmailVerified: false);
    _user = user;
    return await Future.value(user);
  }

  @override
  Future<void> logOut() async {
    if (!_initialized) throw NotInitialisedException();
    if (_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 3));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!_initialized) throw NotInitialisedException();
    final user = _user;
    if (user == null) throw UserNotFoundAuthException();
    // Simulate sending email verification
    const newUser = AuthUser(isEmailVerified: true);
    _user = newUser;
  }
}
