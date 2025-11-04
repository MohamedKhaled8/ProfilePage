 

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/widgets/home_title_subtitle.dart';
import 'package:my_website/features/home/widgets/style_card.dart';

// Build experience cards from About content (without explicit years wording)
class ExperienceCardData {
  final String title;
  final List<String> points;
  const ExperienceCardData({required this.title, required this.points});
}

const List<ExperienceCardData> kExperienceCards = [
  ExperienceCardData(
    title: 'Introduction',
    points: [
      'Passionate mobile developer creating valuable digital products',
      'Focused on solving real-world problems with clean UX and logic',
      'Committed to daily learning, building, and improving',
    ],
  ),
  ExperienceCardData(
    title: 'Who am I',
    points: [
      'Mohamed Khaled — Flutter Developer',
      'Driven by continuous growth and innovation',
      'Seeking opportunities to apply and expand technical skills',
    ],
  ),
  ExperienceCardData(
    title: 'Experience',
    points: [
      'Solid hands‑on experience in mobile development with Flutter',
      'Built scalable, maintainable apps with clean architecture',
      'Transform complex ideas into smooth, usable interfaces',
    ],
  ),
  ExperienceCardData(
    title: 'Skills & Workflow',
    points: [
      'RESTful APIs, Clean Architecture, SOLID, Design Patterns',
      'State management: BLoC, Riverpod, Provider, GetX',
      'Firebase, Payments, Google Maps, Testing & Debugging',
      'Dart, Flutter, Routes, Localization',
    ],
  ),
  ExperienceCardData(
    title: 'Courses Completed',
    points: [
      'Flutter Course — Pepo Code',
      'Tharwat Samy — Flutter Advanced (BLoC & MVVM)',
      'Responsive & Adaptive UI Design',
      'Deep Dive into Clean Architecture',
      'Google Maps Integration',
      'Ali Hassan — Flutter, Dart & Firebase (Arabic)',
    ],
  ),
  ExperienceCardData(
    title: 'Mindset',
    points: [
      'Coding is about building meaningful experiences',
      'Quality, clarity, and maintainability first',
    ],
  ),
];

int get explan => kExperienceCards.length;
const expPointsSize = 16.0;
const expScaleFactor = 150.0;
const expPointsFactor = expHigth / 2 - expPointsSize / 2;

class ExperiencesBody extends StatelessWidget {
  const ExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: "Experiences",
          subtitle:
              "Here is My Professional Experiences in mobile app Devolper",
        ),
        Gap(32),
        context.isDesktop ? DesktopExperiencesBody() : PhoneExperiencesBody(),
      ],
    );
  }
}

class PhoneExperiencesBody extends StatelessWidget {
  const PhoneExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          for (int i = 0; i < kExperienceCards.length; i++) ...[
            ExperienceItem(data: kExperienceCards[i]),
            if (i != kExperienceCards.length - 1)
              SizedBox(
                height: 60,
                child: DottedLine(
                  dashColor: context.colorScheme.onBackground,
                  direction: Axis.vertical,
                ),
              ),
          ]
        ],
      ),
    );
  }
}

class DesktopExperiencesBody extends StatelessWidget {
  const DesktopExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: explan * expScaleFactor + expScaleFactor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: explan * expScaleFactor + expScaleFactor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  colors: [
                    context.colorScheme.primary.withOpacity(0),
                    context.colorScheme.primary,
                    context.colorScheme.primary.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          for (int i = 0; i < explan; i++) ...[
            if (i.isEven)
              Positioned(
                top: i * 150,
                right: 400,
                left: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperienceItem(data: kExperienceCards[i]),
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
              )
            else
              Positioned(
                top: i * 150,
                left: 400,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.colorScheme.onBackground,
                      ),
                    ),
                    ExperienceItem(data: kExperienceCards[i]),
                  ],
                ),
              ),
            Positioned(
              top: i * expScaleFactor,
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                width: expPointsSize,
                height: expPointsSize,
                decoration: BoxDecoration(
                  color: context.colorScheme.onBackground.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: expPointsSize / 2,
                  height: expPointsSize / 2,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onBackground.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

const expWidth = 300.0;
const expHigth = 230.0;

class ExperienceItem extends StatelessWidget {
  final ExperienceCardData data;
  const ExperienceItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      width: expWidth,
      borderEffect: true,
      child: Card(
        child: Column(
          children: [
            Text(
              data.title,
              style: context.textStyle.bodyLgBold.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            const Gap(8),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final p in data.points)
                  ExperienceDescriptionItem(text: p),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceDescriptionItem extends StatelessWidget {
  final String text;
  const ExperienceDescriptionItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.onBackground,
          ),
        ),
        const Gap(6),
        Expanded(
          child: Text(
            text,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
