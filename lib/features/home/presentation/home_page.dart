import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/widgets/app_scaffold.dart';
import 'package:my_website/core/widgets/home_title_subtitle.dart';
import 'package:my_website/features/home/presentation/experiences_body.dart';

import 'package:my_website/features/home/widgets/hero_widget.dart';
import 'package:my_website/features/home/widgets/project_list.dart'
    show ProjectsList;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            child: HeroWidget(),
          ),
        ),
        SliverGap(context.insets.gap),
        SliverToBoxAdapter(child: ExperiencesBody()),
        SliverGap(context.insets.gap),
        SliverToBoxAdapter(
          child: HomeTitleSubtitle(
            title: "Projects",
            subtitle: "Here are some of my recent projects and applications",
          ),
        ),
        SliverGap(32),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          sliver: ProjectsList(),
        ),
      ],
    );
  }
}
