import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/features/home/data/projects_data.dart';
import 'package:my_website/features/home/widgets/project_item.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isDesktopOrTablet ? DesktopProjects() : PhoneProjects();
  }
}

class DesktopProjects extends StatelessWidget {
  const DesktopProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 3 : 2,
      ),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProjectItem(project: ProjectsData.projects[index]);
        },
        childCount: ProjectsData.projects.length,
      ),
    );
  }
}

class PhoneProjects extends StatelessWidget {
  const PhoneProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return ProjectItem(project: ProjectsData.projects[index]);
      },
      separatorBuilder: (context, index) => const Gap(16),
      itemCount: ProjectsData.projects.length,
    );
  }
}
