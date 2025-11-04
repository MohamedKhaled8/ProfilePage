import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_website/core/utils/Database/app_Shard_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale_controller.g.dart';

@riverpod
class AppLocaleController extends _$AppLocaleController{
  @override
  FutureOr<String> build() async {
    final locale = await AppShardPref.getAppLocal(); // انتظر نتيجة الـ Future
    // Initialize the AsyncNotifier state with the loaded locale
    state = AsyncValue.data(locale);
    print('Loaded Locale: $locale'); // اطبع القيمة الفعلية
    return locale;
  }

  void changeLocale(String newLocale) async {
    print('Changing Locale to: $newLocale');
    await AppShardPref.setAppLocal(newLocale);
    // Update the AsyncNotifier state so consumers rebuild
    state = AsyncValue.data(newLocale);
    print('State updated to: ${state.value}');
  }
}
