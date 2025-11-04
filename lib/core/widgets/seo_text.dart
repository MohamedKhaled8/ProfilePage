import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class SeoText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextRendererStyle? textRendererStyle;
  final int? maxlines;
  final TextOverflow? overflow;
  const SeoText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.textRendererStyle, this.maxlines, this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, textAlign: textAlign);
  }
}
