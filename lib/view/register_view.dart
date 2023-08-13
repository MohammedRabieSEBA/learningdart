import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:learningdart/constants/routes.dart';
import 'package:learningdart/services/auth/auth_exceptions.dart';
import 'package:learningdart/services/auth/auth_service.dart';
import 'package:learningdart/utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            autocorrect: false,
            enableSuggestions: false,
            keyboardType: TextInputType.emailAddress,
            decoration:
                const InputDecoration(hintText: 'Enter your email adresse'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(hintText: 'Enter your password'),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase().createUser(
                  email: email,
                  password: password,
                );
                final user = AuthService.firebase().currentUser;
                log(user.toString());
                await AuthService.firebase().sendEmailVerification();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed(
                  verifyEmailRoute,
                );
              } on WeakPasswordAuthException {
                showErrorDialog(
                  context,
                  'Weak Password !',
                );
              } on EmailAlreadyInUseAuthException {
                showErrorDialog(
                  context,
                  'Email is already in use !',
                );
              } on InvalidEmailAuthException {
                showErrorDialog(
                  context,
                  'Invalid email entered',
                );
              } on GenericAuthException {
                {
                  showErrorDialog(
                    context,
                    'Failed to register',
                  );
                }
              }
            },
            child: const Text("Register"),
          ),
          TextButton(
            onPressed: () => {
              Navigator.of(context).pushNamed(
                loginRoute,
              )
            },
            child: const Text('Already registered? Login here !'),
          ),
        ],
      ),
    );
  }
}
