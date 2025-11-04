import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_website/core/widgets/app_bar/drawer_menu.dart';

class AppBarDrawerIcon extends ConsumerStatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  ConsumerState<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends ConsumerState<AppBarDrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    final isMenuOpen = ref.watch(drawerMenuControllerProvider).value ?? false;
    
    // Sync animation with provider state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (isMenuOpen != isOpen) {
        setState(() {
          isOpen = isMenuOpen;
        });
        if (isOpen) {
          controller.forward();
        } else {
          controller.reverse();
        }
      }
    });
    
    return IconButton(
      onPressed: () {
        ref.read(drawerMenuControllerProvider.notifier).toggle();
      },
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
