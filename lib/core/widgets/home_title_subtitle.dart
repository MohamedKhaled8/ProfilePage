import 'package:flutter/material.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/widgets/seo_text.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class HomeTitleSubtitle extends StatelessWidget {
  const HomeTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeoText(
            text: title,
            style: context.textStyle.titleSmBold.copyWith(
              color: context.colorScheme.onBackground,
            ),
            textRendererStyle: TextRendererStyle.header3,
          ),
          SeoText(
            text: subtitle,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onSurface,
            ),
            textRendererStyle: TextRendererStyle.header4,
          ),
        ],
      ),
    );
  }
}
