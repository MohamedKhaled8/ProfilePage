import 'package:flutter/material.dart';
import 'package:my_website/core/utils/constants/app_size.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/utils/theme/app_text_style.dart';
import 'package:my_website/core/widgets/app_bar/app_bar_drawer.dart';
import 'package:my_website/core/widgets/app_bar/drawer_menu.dart';
import 'package:my_website/core/widgets/app_bar/menu..dart';
 
import 'package:screen_go/enums/device_type_enums.dart';
import 'package:screen_go/functions/get_screen_type_func.dart';

class MyappBar extends StatelessWidget {
  const MyappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          alignment: Alignment.center,
          height: context.insets.appBarHeight,
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          color: context.theme.appBarTheme.backgroundColor,
          duration: const Duration(milliseconds: 200),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Insets.maxWidth.toDouble()),
            child: Row(
              children: [
                AppLogo(),
                Spacer(),
                if (context.isDesktop) LargMenu(),
                if (context.isDesktop) Spacer(),
                // Hidden toggles per request
                const SizedBox.shrink(),
                const SizedBox.shrink(),
                if (!context.isDesktop) AppBarDrawerIcon(),
              ],
            ),
          ),
        ),
        if (!context.isDesktop) DrawerMenu(),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = getScreenType(MediaQuery.of(context));

    return Text(
      "portfolio",
      style: deviceType == DeviceType.mobile
          ? SmallTextStyle().titleLgBold
          : SmallTextStyle().titleLgBold,
    );
  }
}
