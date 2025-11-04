import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_website/core/utils/services/app_theme_controller.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeAsync = ref.watch(appThemeControllerProvider);

    return themeAsync.when(
      data: (themeMode) => Switch(
        value: themeMode == ThemeMode.dark,
        onChanged: (value) {
          ref
              .read(appThemeControllerProvider.notifier)
              .changeTheme(value ? ThemeMode.dark : ThemeMode.light);
        },
      ),
      loading: () => const SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (err, _) => Text('Error: $err'),
    );
  }
}
