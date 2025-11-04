import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/app_size.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/features/home/widgets/hero_background.dart';
import 'package:my_website/features/home/widgets/hero_button.dart';
import 'package:my_website/features/home/widgets/hero_text.dart';
import 'package:my_website/features/home/widgets/hero_image.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: HeroBackground()),
        Column(
          children: [
            context.isDesktop || context.isTablet
                ? const LargeHero()
                : const SmallHero(),
          ],
        ),
      ],
    );
  }
}

class SmallHero extends StatelessWidget {
  const SmallHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(constraints: const BoxConstraints(maxWidth: 140)),
        Gap(Insets.xl),
        const HeroTexts(),
        Gap(Insets.xxl),
        const SmallHeroButton(),
      ],
    );
  }
}

class LargeHero extends StatelessWidget {
  const LargeHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: HeroImage()),
        Gap(Insets.xxxl),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeroTexts(),
              Gap(Insets.xxl),
              const LargheroButton(),
            ],
          ),
        ),
      ],
    );
  }
}
