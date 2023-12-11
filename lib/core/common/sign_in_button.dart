import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/controller/auth_cotroller.dart';
import '../../theme/pallete.dart';
import '../constants/constants.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  void onSignInWithGoogle(WidgetRef ref) {
    ref.read(authControllerProvider).signWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton.icon(
        icon: Image.asset(Constants.googleLogo, width: 35),
        onPressed: () => onSignInWithGoogle(ref),
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

// Reloaded 1 of 1087 libraries in 1,375ms (compile: 42 ms, reload: 570 ms, reassemble: 536 ms).
// I/Timeline(12824): Timeline: Activity_launch_request time:99852600 intent:Intent { 
// act=com.google.android.gms.auth.GOOGLE_SIGN_IN pkg=com.example.flutter_reddit_clone cmp=com.example.flutter_reddit_clone/com.google.android.gms.auth.api.signin.internal.SignInHubActivity (has extras) }
// I/Timeline(12824): Timeline: Activity_launch_request time:99852648 intent:Intent { act=com.google.android.gms.auth.GOOGLE_SIGN_IN pkg=com.google.android.gms (has extras) }
// I/flutter (12824): PlatformException(sign_in_failed, com.google.android.gms.common.api.ApiException: 10: , null, null)
