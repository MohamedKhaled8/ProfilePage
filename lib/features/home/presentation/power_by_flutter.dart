import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';

class PoweredByFlutter extends StatelessWidget {
  const PoweredByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterLogo(),
        const Gap(8),
        Text(
          "Powered by Flutter",
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
        const Gap(12),
        Container(
          height: 16,
          width: 1,
          color: context.colorScheme.onBackground.withOpacity(0.3),
        ),
        const Gap(12),
        Text(
          "Mohamed Khaled",
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.colorScheme.onBackground.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
