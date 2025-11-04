import 'package:flutter/material.dart';
import 'package:my_website/core/utils/helper/app_image_helper.dart';

class HeroImage extends StatefulWidget {
  const HeroImage({super.key});

  @override
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 16),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.58,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Pick a pleasant, smaller size relative to the available width
          final double size = (constraints.maxWidth * 0.95).clamp(280.0, 500.0);

          return Center(
            child: SizedBox(
              width: size,
              height: size,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // outer rotating ring (slightly larger than avatar)
                  Positioned.fill(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) {
                        return Transform.rotate(
                          angle: _controller.value * 6.28318,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withOpacity(0.35),
                                width: 2.5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // soft glow behind the avatar
                  Container(
                    width: size * 0.92,
                    height: size * 0.92,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.12),
                          blurRadius: 24,
                          spreadRadius: 4,
                        ),
                      ],
                      gradient: RadialGradient(
                        colors: [
                          Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.15),
                          Colors.transparent,
                        ],
                        stops: const [0.35, 1.0],
                      ),
                    ),
                  ),

                  // circular avatar with a clean border
                  Container(
                    width: size * 0.92,
                    height: size * 0.92,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.onBackground.withOpacity(0.08),
                        width: 1.2,
                      ),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: const ClipOval(
                      child: AppImageHelper(
                        path: "assets/images/backgrounds/me.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
