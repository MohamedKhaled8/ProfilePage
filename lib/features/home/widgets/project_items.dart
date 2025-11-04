import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/features/home/widgets/style_card.dart';

// This file is deprecated. Use ProjectItem instead.
// Keeping for backward compatibility only.
class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: const CircleAvatar(backgroundImage: NetworkImage('src')),
              ),
              const Gap(16),
              Expanded(
                child: Text(
                  'Project Name',
                  style: context.textStyle.bodyLgBold.copyWith(
                    color: context.colorScheme.onBackground,
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
          Text(
            'Project Description',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
