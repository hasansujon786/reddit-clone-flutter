import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../theme/pallete.dart';
import '../../../theme/theme_controller.dart';
import '../../auth/controller/auth_cotroller.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});

  void onSignOut(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signOut();
  }

  void navToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/u/$uid');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(signedInUserProvider)!;
    final themeMode = ref.watch(themeControllerProvider).value;

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(radius: 70, backgroundImage: NetworkImage(user.displayImage)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text('u/${user.name}', style: const TextStyle(fontSize: 18)),
            ),
            const Divider(endIndent: 12, indent: 12, height: 2),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () => navToUserProfile(context, user.uid),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Pallete.redColor),
              title: Text('Log Out', style: TextStyle(color: Pallete.redColor)),
              onTap: () => onSignOut(ref),
            ),
            const Spacer(),
            Stack(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings', style: TextStyle()),
                  onTap: () {},
                ),
                Positioned(
                  right: 8,
                  top: 6,
                  child: Switch.adaptive(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (val) {
                      ref.read(themeControllerProvider.notifier).toggleTheme();
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
