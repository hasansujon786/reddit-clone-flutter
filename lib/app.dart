import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'core/common/error_text.dart';
import 'core/common/loader.dart';
import 'features/auth/controller/auth_cotroller.dart';
import 'routes.dart';
import 'theme/pallete.dart';
import 'theme/theme_controller.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  void _getData(WidgetRef ref, User authChangedData) async {
    final foundUser = await ref.read(authControllerProvider.notifier).getUserData(authChangedData.uid).first;
    if (foundUser != null) {
      ref.read(signedInUserProvider.notifier).update((state) => foundUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    final signInUser = ref.watch(signedInUserProvider);
    final themeMode = ref.watch(themeControllerProvider).value;

    return ref.watch(authStateChangedProvider).when(
          data: (authChangedData) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Reddit Tutorial',
            themeMode: themeMode,
            theme: Pallete.lightModeAppTheme,
            darkTheme: Pallete.darkModeAppTheme,
            routeInformationParser: const RoutemasterParser(),
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) {
                if (authChangedData != null) {
                  if (signInUser == null) {
                    _getData(ref, authChangedData);
                  } else {
                    return authUserRoutes;
                  }
                }
                return guestUserRoutes;
              },
            ),
          ),
          error: rpErrorView,
          loading: rpLodingView,
        );
  }
}
