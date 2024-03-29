import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/community/screens/add_mods_screen.dart';
import 'features/community/screens/community_screen.dart';
import 'features/community/screens/create_community_screens.dart';
import 'features/community/screens/edit_commnity_screen.dart';
import 'features/community/screens/mods_tools_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'features/post/screens/add_post_type_screen.dart';
import 'features/user_profile/screens/edit_profile_screen.dart';
import 'features/user_profile/screens/user_profile_screen.dart';

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
    ModsToolsScreen.routeName: (info) => MaterialPage(child: ModsToolsScreen(name: info.pathParameters['name']!)),
    EditCommnityScreen.routeName: (info) => MaterialPage(child: EditCommnityScreen(name: info.pathParameters['name']!)),
    AddModsScreen.routeName: (info) => MaterialPage(child: AddModsScreen(name: info.pathParameters['name']!)),
    UserProfileScreen.routeName: (info) => MaterialPage(child: UserProfileScreen(uid: info.pathParameters['uid']!)),
    EditProfileScreen.routeName: (info) => MaterialPage(child: EditProfileScreen(uid: info.pathParameters['uid']!)),
    AddPostTypeScreen.routeName: (info) => MaterialPage(child: AddPostTypeScreen(type: info.pathParameters['type']!)),
  },
);
