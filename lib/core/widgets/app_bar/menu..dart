import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_website/core/utils/constants/app_size.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/utils/theme/app_text_style.dart';
import 'package:my_website/core/widgets/app_bar/app_menu_list.dart';

class LargMenu extends StatelessWidget {
  const LargMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...AppMenuList.getItems(context)
            .map(
              (AppMenu e) => LargeAppBarMenuItem(
                text: e.title,
                isSelected: GoRouterState.of(context).fullPath == e.path,
                onTap: () {
                  context.go(e.path);
                },
              ),
            )
            .toList(),
      ],
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...AppMenuList.getItems(context)
            .map(
              (AppMenu e) => LargeAppBarMenuItem(
                text: e.title,
                isSelected: GoRouterState.of(context).fullPath == e.path,
                onTap: () {
                  context.go(e.path);
                },
              ),
            )
            .toList(),
      ],
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const LargeAppBarMenuItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.med,
          vertical: Insets.xs,
        ),
        child: Text(
          text,
          style: SmallTextStyle().bodyLgMedium.copyWith(
            color: isSelected
                ? context.colorScheme.onBackground
                : context.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
