import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';

enum ThemeType { light, dark, cool }

class AppThemeManager extends GetxController {
  Rx<ThemeType> themeType = ThemeType.light.obs;

  @override
  void onInit() {
    super.onInit();

    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    String? theme = prefs.getString("theme");

    if (theme == "dark") {
      themeType.value = ThemeType.dark;
    } else if (theme == "cool") {
      themeType.value = ThemeType.cool;
    } else {
      themeType.value = ThemeType.light;
    }
  }

  Future<void> changeTheme(ThemeType theme) async {
    themeType.value = theme;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("theme", theme.name);

    update();
  }

  Color get primary {
    switch (themeType.value) {
      case ThemeType.dark:
        return DarkThemeColors.primary;

      case ThemeType.cool:
        return CoolThemeColors.primary;

      default:
        return LightThemeColors.primary;
    }
  }

  Color get background {
    switch (themeType.value) {
      case ThemeType.dark:
        return DarkThemeColors.background;

      case ThemeType.cool:
        return CoolThemeColors.background;

      default:
        return LightThemeColors.background;
    }
  }

  Color get surface {
    switch (themeType.value) {
      case ThemeType.dark:
        return DarkThemeColors.surface;

      case ThemeType.cool:
        return CoolThemeColors.surface;

      default:
        return LightThemeColors.surface;
    }
  }

  Color get text {
    switch (themeType.value) {
      case ThemeType.dark:
        return DarkThemeColors.text;

      case ThemeType.cool:
        return CoolThemeColors.text;

      default:
        return LightThemeColors.text;
    }
  }

  Color get subText {
    switch (themeType.value) {
      case ThemeType.dark:
        return DarkThemeColors.subText;

      case ThemeType.cool:
        return CoolThemeColors.subText;

      default:
        return LightThemeColors.subText;
    }
  }
}
