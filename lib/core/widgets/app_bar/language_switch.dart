import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/app_icon.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/utils/services/app_locale_controller.dart';
import 'package:my_website/core/widgets/seo_text.dart';

class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<String> locale = ref.watch(appLocaleControllerProvider);
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: PopLanguageSwitchItem(language: "English", icon: AppIcon.us),
          ),
          PopupMenuItem(
            value: 1,
            child: PopLanguageSwitchItem(language: "Arabic", icon: AppIcon.ar),
          ),
        ];
      },
      initialValue: locale.value == 'en' ? 0 : 1,
      onSelected: (int value) {
        if (value == 0) {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('en');
        } else if (value == 1) {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('ar');
        }
      },
      child: Row(
        children: [
          Icon(Icons.language, color: context.colorScheme.onBackground),
          const Gap(8),

          SeoText(text: locale.value == 'en' ? 'En' : 'ar'),
        ],
      ),
    );
  }
}

class PopLanguageSwitchItem extends StatelessWidget {
  final String language;
  final String icon;

  const PopLanguageSwitchItem({
    super.key,
    required this.language,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        Gap(8),
        Text(language),
      ],
    );
  }
}
