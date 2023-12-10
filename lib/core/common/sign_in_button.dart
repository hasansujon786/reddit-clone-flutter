import 'package:flutter/material.dart';

import '../../theme/pallete.dart';
import '../constants/constants.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton.icon(
        icon: Image.asset(Constants.googleLogo, width: 35),
        onPressed: () {},
        label: const Text(
          'Continue with Google',
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.greyColor,
          foregroundColor: Pallete.whiteColor,
          minimumSize: const Size(double.infinity, 50)
        ),
      ),
    );
  }
}
