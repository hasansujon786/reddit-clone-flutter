import 'package:flutter/material.dart';

import 'features/auth/screens/login_screen.dart';
import 'theme/pallete.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit',
      theme: Pallete.darkModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
