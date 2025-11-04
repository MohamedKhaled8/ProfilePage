import 'package:flutter/material.dart';
import 'package:my_website/core/utils/Database/app_Shard_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_theme_controller.g.dart';

@riverpod
class AppThemeController extends _$AppThemeController {
  @override
  Future<ThemeMode> build() {
    return AppShardPref.getAppTheme();
  }

  void changeTheme(ThemeMode newTheme) async {
    await AppShardPref.setAppTheme(
      newTheme == ThemeMode.dark ? 'dark' : 'light',
    );

    state = AsyncData(newTheme);
  }
}
