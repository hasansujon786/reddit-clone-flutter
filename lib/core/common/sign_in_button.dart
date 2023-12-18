import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/controller/auth_cotroller.dart';
import '../../theme/pallete.dart';
import '../constants/constants.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  void onSignInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton.icon(
        icon: Image.asset(Constants.googleLogo, width: 35),
        onPressed: () => onSignInWithGoogle(context, ref),
        label: const Text(
          'Continue with Google',
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greyColor,
            foregroundColor: Pallete.whiteColor,
            minimumSize: const Size(double.infinity, 50)),
      ),
    );
  }
}
