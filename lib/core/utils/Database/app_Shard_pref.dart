import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

class AppShardPref {
  static const String localeKey = 'app_locale';
  static const String themeKey = 'app_theme';

  // ===== اللغة (تبقى كما هي) =====
  static Future<void> setAppLocal(String local) async {
    try {
      final shardPref = await SharedPreferences.getInstance();
      await shardPref.setString(localeKey, local);
      print('Locale saved in SharedPreferences: $local');
    } catch (e) {
      print('Error saving locale to SharedPreferences: $e');
    }
  }

  static Future<String> getAppLocal() async {
    try {
      final shardPref = await SharedPreferences.getInstance();
      final val = shardPref.getString(localeKey) ?? 'en';
      print('Locale loaded from SharedPreferences: $val');
      return val;
    } catch (e) {
      print('Error reading locale from SharedPreferences: $e');
      return 'en';
    }
  }

  // ===== الثيم (localStorage للويب فقط) =====
  static Future<void> setAppTheme(String theme) async {
    if (kIsWeb) {
      // 🟢 التخزين في localStorage على الويب
      html.window.localStorage[themeKey] = theme;
      print('Theme saved in localStorage: $theme');
    } else {
      // 📱 التخزين في SharedPreferences على الهاتف
      final shardPref = await SharedPreferences.getInstance();
      await shardPref.setString(themeKey, theme);
      print('Theme saved in SharedPreferences: $theme');
    }
  }

  static Future<ThemeMode> getAppTheme() async {
    if (kIsWeb) {
      // 🟢 القراءة من localStorage على الويب
      final theme = html.window.localStorage[themeKey];
      print('Theme loaded from localStorage: $theme');

      if (theme == null) {
        html.window.localStorage[themeKey] = 'light';
        return ThemeMode.light;
      }

      return theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    } else {
      // 📱 القراءة من SharedPreferences على الهاتف
      final shardPref = await SharedPreferences.getInstance();
      final theme = shardPref.getString(themeKey);
      print('Theme loaded from SharedPreferences: $theme');

      if (theme == null) {
        await shardPref.setString(themeKey, 'light');
        return ThemeMode.light;
      }

      return theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }
}
