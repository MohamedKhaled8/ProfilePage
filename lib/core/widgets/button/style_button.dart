import 'package:flutter/material.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/utils/constants/my_colors.dart';
import 'package:my_website/core/widgets/seo_text.dart';

class PrimaryButton extends StatelessWidget {
  final String title;

  const PrimaryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: ColorsManger.gray[100],
        ),
      ),
    );
  }
}
class OutlineButton extends StatelessWidget {
  final String title;

  const OutlineButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: SeoText(   
        text: title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: context.colorScheme.onBackground,
        ),
      ),
    );
  }
}
