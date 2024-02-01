import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeServiceProvider = Provider<ThemeStorageService>((ref) => ThemeStorageServiceImpl());
final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

Future<void> initThemeController(ProviderContainer container) async {
  final storageService = container.read(themeServiceProvider);
  final mode = await storageService.loadThemeMode();
  container.read(themeModeProvider.notifier).update(mode);
}

class ThemeModeNotifier extends Notifier<ThemeMode> {
  late ThemeStorageService _storageService;

  @override
  ThemeMode build() {
    _storageService = ref.read(themeServiceProvider);
    return ThemeMode.light;
  }

  Future<void> update(ThemeMode nextMode) async {
    state = nextMode;
    await _storageService.saveThemeMode(nextMode);
  }

  void toggleTheme() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await _storageService.saveThemeMode(state);
  }
}

abstract class ThemeStorageService {
  Future<ThemeMode> loadThemeMode();
  Future<void> saveThemeMode(ThemeMode mode);
}

class ThemeStorageServiceImpl extends ThemeStorageService {
  @override
  Future<ThemeMode> loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', mode.name);
  }
}
