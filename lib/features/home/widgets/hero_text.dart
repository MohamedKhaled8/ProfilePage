import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/app_size.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktopOrTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        // Hello & Welcome (small intro line)
        Align(
          alignment: context.isDesktopOrTablet
              ? Alignment.centerLeft
              : Alignment.center,
          child: Text(
            'Hello & Welcome',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onBackground.withOpacity(0.8),
            ),
          ),
        ),
        Gap(Insets.sm),
        Align(
          alignment: context.isDesktopOrTablet
              ? Alignment.centerLeft
              : Alignment.center,
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            repeatForever: false,
            totalRepeatCount: 1,
            animatedTexts: [
              TyperAnimatedText(
                'Mohamed Khaled',
                textAlign: context.isDesktopOrTablet
                    ? TextAlign.left
                    : TextAlign.center,
                speed: const Duration(milliseconds: 60),
                textStyle: context.textStyle.titleLgBold.copyWith(
                  color: context.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),

        Gap(Insets.sm),
        // I Am ... [rotating roles]
        Align(
          alignment: context.isDesktopOrTablet
              ? Alignment.centerLeft
              : Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'I Am ',
                style: context.textStyle.titleMdMedium.copyWith(
                  color: context.colorScheme.onBackground,
                ),
              ),
              AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 1200),
                animatedTexts: [
                  TyperAnimatedText(
                    'a Mobile Developer.',
                    speed: const Duration(milliseconds: 45),
                    textStyle: context.textStyle.titleMdMedium.copyWith(
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                  TyperAnimatedText(
                    'a Flutter Engineer.',
                    speed: const Duration(milliseconds: 45),
                    textStyle: context.textStyle.titleMdMedium.copyWith(
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                  TyperAnimatedText(
                    'a Problem Solver.',
                    speed: const Duration(milliseconds: 45),
                    textStyle: context.textStyle.titleMdMedium.copyWith(
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(Insets.xl),
        Align(
          alignment: context.isDesktopOrTablet
              ? Alignment.centerLeft
              : Alignment.center,
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            repeatForever: false,
            totalRepeatCount: 1,
            animatedTexts: [
              TyperAnimatedText(
                'Mobile application developer , Proficient in Flutter and Android | iOs  development.',
                textAlign: context.isDesktopOrTablet
                    ? TextAlign.left
                    : TextAlign.center,
                speed: const Duration(milliseconds: 20),
                textStyle: context.textStyle.bodyMdMedium.copyWith(
                  color: context.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
