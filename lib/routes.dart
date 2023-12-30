import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/community/screens/community_screen.dart';
import 'features/community/screens/create_community_screens.dart';
import 'features/home/screens/home_screen.dart';

final guestUserRoutes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: LoginScreen()),
  },
);

final authUserRoutes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    CreateCommunityScreens.routeName: (_) => const MaterialPage(child: CreateCommunityScreens()),
    CommunityScreen.routeName: (info) => MaterialPage(child: CommunityScreen(name: info.pathParameters['name']!)),
  },
);
