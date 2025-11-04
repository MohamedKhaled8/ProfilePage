import 'package:flutter/material.dart';

class HeroBackground extends StatefulWidget {
  const HeroBackground({super.key});

  @override
  State<HeroBackground> createState() => _HeroBackgroundState();
}

class _HeroBackgroundState extends State<HeroBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 20),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return CustomPaint(
            painter: _HeroBgPainter(t: t, colorScheme: Theme.of(context).colorScheme),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _HeroBgPainter extends CustomPainter {
  final double t;
  final ColorScheme colorScheme;
  _HeroBgPainter({required this.t, required this.colorScheme});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.7, size.height * 0.3);

    // soft gradient blobs similar to reference
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 60);

    paint.color = colorScheme.primary.withOpacity(0.18);
    canvas.drawCircle(center + Offset(60 * (t * 2 - 1), 0), 160, paint);

    paint.color = colorScheme.secondary.withOpacity(0.14);
    canvas.drawCircle(center + Offset(-140 * (t * 2 - 1), 40), 130, paint);

    paint.color = colorScheme.tertiary.withOpacity(0.12);
    canvas.drawCircle(center + Offset(0, -120 * (t * 2 - 1)), 110, paint);

    // subtle rotating ring arc behind avatar spot
    final ringCenter = Offset(size.width * 0.25, size.height * 0.38);
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = colorScheme.primary.withOpacity(0.35);

    final rect = Rect.fromCircle(center: ringCenter, radius: 180);
    final start = t * 6.28318; // 2π * t
    canvas.drawArc(rect, start, 3.7, false, ringPaint);

    // moving small dots (orbit-like)
    final dots = [
      _orbitPoint(ringCenter, 200, start),
      _orbitPoint(ringCenter, 150, start + 1.8),
      _orbitPoint(ringCenter, 230, start + 3.2),
    ];
    final dotPaint = Paint()..color = colorScheme.onBackground.withOpacity(0.6);
    for (final p in dots) {
      canvas.drawCircle(p, 3, dotPaint);
    }
  }

  Offset _orbitPoint(Offset c, double r, double ang) {
    return Offset(c.dx + r * Math.cos(ang), c.dy + r * Math.sin(ang));
  }

  @override
  bool shouldRepaint(covariant _HeroBgPainter oldDelegate) => oldDelegate.t != t || oldDelegate.colorScheme != colorScheme;
}

// Minimal math helper to avoid importing dart:math at top-level
class Math {
  static const double pi = 3.1415926535897932;
  static double sin(double x) => MathHelper.sin(x);
  static double cos(double x) => MathHelper.cos(x);
}

class MathHelper {
  // very lightweight Taylor approximations for visual animation (not numerically strict)
  static double sin(double x) {
    while (x > 3.14159265) x -= 6.2831853;
    while (x < -3.14159265) x += 6.2831853;
    final x2 = x * x;
    return x * (1 - x2 / 6 + x2 * x2 / 120 - x2 * x2 * x2 / 5040);
  }

  static double cos(double x) {
    while (x > 3.14159265) x -= 6.2831853;
    while (x < -3.14159265) x += 6.2831853;
    final x2 = x * x;
    return 1 - x2 / 2 + x2 * x2 / 24 - x2 * x2 * x2 / 720;
  }
}


