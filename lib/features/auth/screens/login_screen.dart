import 'package:flutter/material.dart';

import '../../../core/common/sign_in_button.dart';
import '../../../core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Image.asset(Constants.appLogo, height: 40),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Dive into anything', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(Constants.loginEmote, height: 400),
          ),
          const Spacer(),
          const SignInButton(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
