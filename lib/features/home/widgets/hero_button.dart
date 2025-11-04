import 'package:flutter/material.dart';
import 'package:my_website/features/home/widgets/contact_button.dart';

class LargheroButton extends StatelessWidget {
  const LargheroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContactButton();
  }
}

class SmallHeroButton extends StatelessWidget {
  const SmallHeroButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: ContactButton(),
    );
  }
}
