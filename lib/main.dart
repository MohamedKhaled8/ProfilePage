import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_website/core/routes/app_router.dart';
import 'package:my_website/core/utils/services/app_locale_controller.dart';
import 'package:my_website/core/utils/theme/app_theme.dart';
import 'package:my_website/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: MyResume()));
}

class MyResume extends ConsumerWidget {
  const MyResume({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(appLocaleControllerProvider);
    // Theme is forced to dark mode; toggling is hidden

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: Locale(local.value ?? 'en'),

      routerConfig: AppRouter.router, // هنا المهم
      darkTheme: AppTheme(fontFamily: _fontFamily(local.value)).dark,
      themeMode: ThemeMode.dark,
      theme: AppTheme(fontFamily: _fontFamily(local.value)).light,
    );
  }

  String _fontFamily(String? local) {
    return (local ?? 'en') == 'en' ? 'Poppins' : 'Yekan';
  }
}
