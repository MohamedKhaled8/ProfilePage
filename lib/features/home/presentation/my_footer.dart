import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_website/core/utils/constants/app_icon.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/widgets/app_bar/menu..dart';
import 'package:my_website/core/widgets/app_bar/myapp_bar.dart';
import 'package:my_website/features/home/presentation/power_by_flutter.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.padding),
      child: Column(
        children: [
          context.isDesktop ? DesktopFooter() : PhoneFooter(),
          const Divider(height: 24),
          PoweredByFlutter(),
        ],
      ),
    );
  }
}

class PhoneFooter extends StatelessWidget {
  const PhoneFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [AppLogo(), SmallMenu(), FotterLinkes()]);
  }
}

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        AppLogo(),
        Spacer(),
        LargMenu(),
        Spacer(),
        FotterLinkes(),
      ],
    );
  }
}

class FotterLinkes extends StatelessWidget {
  const FotterLinkes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FotterLinkItem(
          icon: AppIcon.facebook,
          onPresses: () async {
            final uri = Uri.parse(
              'https://www.facebook.com/mohamedkhaled.khalil.5',
            );
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
        ),
        FotterLinkItem(
          icon: AppIcon.github,
          onPresses: () async {
            final uri = Uri.parse('https://github.com/MohamedKhaled8');
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
        ),
        FotterLinkItem(
          icon: AppIcon.linkedin,
          onPresses: () async {
            final uri = Uri.parse(
              'https://www.linkedin.com/in/mohamed-khaled-0341a2224',
            );
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
        ),
        FotterLinkItem(
          icon: AppIcon.whatsapp,
          onPresses: () async {
            final uri = Uri.parse('https://wa.me/01026331866');
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
        ),
      ],
    );
  }
}

class FotterLinkItem extends StatelessWidget {
  final VoidCallback onPresses;
  final String icon;
  const FotterLinkItem({
    super.key,
    required this.onPresses,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPresses,
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          context.colorScheme.onBackground,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
