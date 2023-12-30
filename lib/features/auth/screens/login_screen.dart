import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/loader.dart';
import '../../../core/common/sign_in_button.dart';
import '../../../core/constants/constants.dart';
import '../../../core/models/user_model.dart';
import '../controller/auth_cotroller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthLoading = ref.watch(authControllerProvider);
    final user = ref.watch(signedInUserProvider);

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
      body: isAuthLoading
          ? const Loader()
          : Column(
              children: [
                const SizedBox(height: 30),
                const Text('Dive into anything', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(Constants.loginEmote, height: 400),
                ),
                const Spacer(),
                buildUserInfo(user),
                const Spacer(),
                const SignInButton(),
                const SizedBox(height: 24),
              ],
            ),
    );
  }

  Widget buildUserInfo(UserModel? user) {
    if (user == null) {
      return const Text('no user');
    }
    return Text(user.name);
  }
}
// TODO: fix this
// W/ProviderInstaller(17589): Failed to load providerinstaller module: No acceptable module com.google.android.gms.providerinstaller.dynamite found. Local version is 0 and remote version is 0.
