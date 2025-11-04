import 'package:flutter/material.dart';
import 'package:my_website/core/utils/constants/app_size.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/widgets/app_bar/myapp_bar.dart';
import 'package:my_website/features/home/presentation/my_footer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.slivers});

  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: Insets.maxWidth),
              padding: EdgeInsets.only(top: context.insets.appBarHeight),
              child: CustomScrollView(
                slivers: [
                  ...slivers,
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: MyFooter(),
                  ),
                ],
              ),
            ),
          ),
          const MyappBar()
        ],
      ),
    );
  }
}
