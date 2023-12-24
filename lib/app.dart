import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'core/models/user_model.dart';
import 'features/auth/controller/auth_cotroller.dart';
import 'routes.dart';
import 'theme/pallete.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, User userData) async {
    userModel = await ref.watch(authControllerProvider.notifier).getUserData(userData.uid).first;
    ref.read(signedInUserProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Reddit Tutorial',
      // theme: ref.watch(themeNotifierProvider),

      theme: Pallete.darkModeAppTheme,
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
        return ref.watch(authStateChangedProvider).when(
              data: (userData) {
                if (userData != null) {
                  getData(ref, userData);
                  if (userModel != null) {
                    return authUserRoutes;
                  }
                }
                return guestUserRoutes;
              },
              error: (error, stackTrace) => guestUserRoutes,
              loading: () => guestUserRoutes,
            );
      }),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
