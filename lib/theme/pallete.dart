import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_controller.dart';

final themeProvider = Provider<ThemeData>((ref) {
  final themeMode = ref.watch(themeModeProvider);

  if (themeMode == ThemeMode.dark) return Pallete.darkModeAppTheme;
  return Pallete.lightModeAppTheme;
});

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static final redColor = Colors.red.shade500;
  static final blueColor = Colors.blue.shade300;

  // Themes
  static final darkModeAppTheme = ThemeData.dark().copyWith(
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 12, color: Colors.grey.shade400),
      titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      titleMedium: const TextStyle(fontSize: 16,  fontWeight: FontWeight.w500),
    ),
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: redColor,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(blueColor),
        side: const MaterialStatePropertyAll(BorderSide(color: Colors.blue)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
      // labelStyle: const TextStyle(
      //   // color: kYellow,
      //   fontSize: 24.0,
      // ),
    ),
    // backgroundColor: drawerColor, // will be used as alternative background color
  );

  static final lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: redColor,
    // backgroundColor: whiteColor,
  );
}
