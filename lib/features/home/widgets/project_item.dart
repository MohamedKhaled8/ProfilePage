import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/features/home/models/project_model.dart';
import 'package:my_website/features/home/widgets/style_card.dart';

class ProjectItem extends StatelessWidget {
  final ProjectModel project;
  const ProjectItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return StyledCard(
      borderEffect: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            project.title,
            style: context.textStyle.bodyLgBold.copyWith(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const Gap(12),

          // Description
          Text(
            isArabic ? project.descriptionAr : project.description,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const Gap(12),

          // Date
          if (project.date.isNotEmpty) ...[
            Text(
              'Date: ${project.date}',
              style: context.textStyle.bodySmMedium.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const Gap(12),
          ],

          // Features
          if (project.features.isNotEmpty) ...[
            Text(
              'Features:',
              style: context.textStyle.bodyMdBold.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            const Gap(8),
            ...project.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        feature,
                        style: context.textStyle.bodySmMedium.copyWith(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(12),
          ],

          // Links
          Row(
            children: [
              if (project.playStoreUrl != null)
                _LinkButton(
                  label: 'Play Store',
                  url: project.playStoreUrl!,
                  context: context,
                ),
              if (project.playStoreUrl != null && project.githubUrl != null)
                const Gap(8),
              if (project.githubUrl != null)
                _LinkButton(
                  label: 'GitHub',
                  url: project.githubUrl!,
                  context: context,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatefulWidget {
  final String label;
  final String url;
  final BuildContext context;

  const _LinkButton({
    required this.label,
    required this.url,
    required this.context,
  });

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.12,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final hoverTextColor = isDarkMode ? Colors.white : Colors.black87;
    final hoverBgColor = isDarkMode
        ? widget.context.colorScheme.primary
        : widget.context.colorScheme.primary.withOpacity(0.9);

    return MouseRegion(
      onEnter: (_) {
        if (!mounted) return;
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        if (!mounted) return;
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: InkWell(
              onTap: () async {
                final uri = Uri.parse(widget.url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? hoverBgColor
                      : (isDarkMode
                            ? Colors.white
                            : widget.context.colorScheme.onBackground
                                  .withOpacity(0.08)),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _isHovered
                        ? hoverBgColor
                        : (isDarkMode
                              ? Colors.black54
                              : widget.context.colorScheme.onBackground
                                    .withOpacity(0.25)),
                    width: _isHovered ? 2.5 : 1.5,
                  ),
                ),
                child: Text(
                  widget.label,
                  style: widget.context.textStyle.bodySmMedium.copyWith(
                    color: _isHovered
                        ? hoverTextColor
                        : (isDarkMode
                              ? Colors.black
                              : widget.context.colorScheme.onBackground),
                    fontWeight: _isHovered ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
