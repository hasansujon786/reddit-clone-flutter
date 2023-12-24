import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/home/screens/home_screen.dart';

final guestUserRoutes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: LoginScreen()),
  },
);

final authUserRoutes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    // '/feed/profile/:id': (info) => MaterialPage(child: ProfilePage(id: info.pathParameters['id'])),
  },
);
