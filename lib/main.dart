import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/view/login_view.dart';
import 'package:learningdart/view/register_view.dart';

import 'firebase_options.dart ';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView()
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const LoginView();
          // final currentUser = FirebaseAuth.instance.currentUser;
          // print(currentUser);
          // if (currentUser?.emailVerified ?? false) {
          // } else {
          //   print("You need to verify your email first");
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => const VerifyEmailView(),
          //     ),
          //   );
          // }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
