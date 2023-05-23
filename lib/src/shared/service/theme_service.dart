import 'package:app_miscelanea/src/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends ChangeNotifier {
  final String key = 'isDarkTheme';

  SharedPreferences? prefs;

  late bool isDarkTheme = false;

  ThemeData get theme =>
      isDarkTheme ? AppTheme().themeDark : AppTheme().themeLight;

  _startPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  _saveThemePrefs() async {
    await _startPrefs();
    prefs?.setBool(key, isDarkTheme);
  }

  loadThemePrefs() async {
    await _startPrefs();
    isDarkTheme = prefs?.getBool(key) ?? false;
    notifyListeners();
  }

  changeTheme() async {
    await _startPrefs();
    isDarkTheme = !isDarkTheme;
    await _saveThemePrefs();
    notifyListeners();
  }
}
