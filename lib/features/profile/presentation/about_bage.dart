import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/widgets/app_scaffold.dart';
import 'package:my_website/core/widgets/seo_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: Image.asset(
                    'assets/images/backgrounds/me2.jpg',
                  ).image,
                ),
                const Gap(16),
                SeoText(
                  text: "Mohamed Khaled",
                  style: context.textStyle.titleSmBold,
                ),
                const Gap(16),
                SeoText(
                  text: """
INTRODUCTION:
I am a passionate mobile application developer who enjoys creating valuable digital products that solve real-world problems. I always aim to get better every single day — learning, building, improving, and helping others whenever possible.

WHO AM I:
My name is Mohamed Khaled — Flutter Developer driven by continuous growth and innovation in the software field. I’m always seeking the right opportunities to apply my experience while enhancing my technical and problem-solving skills.

EXPERIENCE:
I have 2 years of hands-on experience in mobile development using Flutter. During my journey I built scalable, maintainable projects using clean architecture and professional state-management approaches.
I enjoy turning complex ideas into smooth and usable interfaces with clear logic and clean code.

SKILLS & WORKFLOW:
RESTful APIs | Design Patterns | MVVM | MVC | Clean Architecture | Clean Code | Git | SOLID Principles | Dart | Flutter Development | Bloc Pattern | Riverpod | Provider | GetX | Routes | Firebase | Localization | Testing & Debugging | Payment Integration | Google Maps | Data Structures | Algorithms | C++

COURSES COMPLETED:
• Flutter Course in Pepo Code  
• Tharwat Samy – Flutter Advanced (BLoC & MVVM Pattern)  
• Mastering Flutter: Responsive & Adaptive UI Design  
• Mastering Programming: A Comprehensive Course  
• Deep Dive into Clean Architecture in Flutter  
• Flutter App Creation: Google Maps Integration Guide  
• Ali Hassan – Flutter, Dart & Firebase Complete Development Course (Arabic)

CONCLUSION:
I believe coding is not just writing code — it’s building meaningful experiences.
""",
                  style: context.textStyle.bodyMdMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
