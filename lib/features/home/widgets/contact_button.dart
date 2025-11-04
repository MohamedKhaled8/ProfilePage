import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';

class ContactButton extends StatefulWidget {
  const ContactButton({super.key});

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
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
        ? context.colorScheme.primary 
        : context.colorScheme.primary.withOpacity(0.9);
    
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
            child: OutlinedButton(
              onPressed: () async {
                final uri = Uri.parse('https://wa.me/01026331866');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: context.isDesktop ? 48 : 40,
                  vertical: context.isDesktop ? 20 : 18,
                ),
                minimumSize: Size(
                  context.isDesktop ? 200 : double.infinity,
                  context.isDesktop ? 56 : 50,
                ),
                side: BorderSide(
                  color: _isHovered
                      ? hoverBgColor
                      : context.colorScheme.primary.withOpacity(0.6),
                  width: _isHovered ? 3 : 2,
                ),
                backgroundColor: _isHovered
                    ? hoverBgColor
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
                child: Text(
                'Contact Me',
                style: context.textStyle.bodyLgMedium.copyWith(
                  color: _isHovered
                      ? hoverTextColor
                      : context.colorScheme.onBackground,
                  fontWeight: _isHovered ? FontWeight.w800 : FontWeight.w600,
                  fontSize: context.isDesktop ? 18 : 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

