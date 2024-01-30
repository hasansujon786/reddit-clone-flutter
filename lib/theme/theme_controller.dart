import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  Future<ThemeMode> build() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (state.value == ThemeMode.dark) {
      state = const AsyncValue.data(ThemeMode.light);
      prefs.setString('theme', 'light');
    } else {
      state = const AsyncValue.data(ThemeMode.dark);
      prefs.setString('theme', 'dark');
    }
  }
}
