import 'package:flutter/material.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';

class StyledCard extends StatefulWidget {
  final Widget child;
  final bool borderEffect;
  const StyledCard({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.borderEffect = false,
    required this.child,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.borderEffect) ...[
          const BorderShadow(),
          const Positioned(bottom: 0, right: 0, child: BorderShadow()),
        ],
        Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.outline),
            color: context.colorScheme.surface,
            borderRadius:
                widget.borderRadius ??
                const BorderRadius.all(Radius.circular(24)),
          ),
          child: widget.child,
        ),
        if (widget.borderEffect)
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: CurvedLinePainter(color: context.colorScheme.primary),
              ),
            ),
          ),
      ],
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  final Color color;

  CurvedLinePainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const lineSize = 60.0;

    final topLeftPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [color.withOpacity(0), color, color.withOpacity(0)],
      ).createShader(Rect.fromLTWH(0, 0, lineSize, lineSize))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final bottomRightPaint = Paint()
      ..shader =
          LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [color.withOpacity(0), color, color.withOpacity(0)],
          ).createShader(
            Rect.fromLTWH(
              size.width - lineSize,
              size.height - lineSize,
              lineSize,
              lineSize,
            ),
          )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    // example draw line (you probably want this)
    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);

    final path2 = Path();
    path2.moveTo(size.width - lineSize, size.height);
    path2.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height - lineSize,
    );

    canvas.drawPath(path, topLeftPaint);
    canvas.drawPath(path2, bottomRightPaint);
  }

  @override
  bool shouldRepaint(CurvedLinePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CurvedLinePainter oldDelegate) => true;
}

class BorderShadow extends StatelessWidget {
  const BorderShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
