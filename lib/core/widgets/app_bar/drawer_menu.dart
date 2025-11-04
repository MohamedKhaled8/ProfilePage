import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_website/core/utils/constants/extiensions.dart';
import 'package:my_website/core/widgets/app_bar/menu..dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_menu.g.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final _animation = Tween<Offset>(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 ref.listen(drawerMenuControllerProvider , (previous, next) {
      if (next.value == true) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
    // 🔄 التحكم في الأنيميشن بناءً على الحالة
 
    return ClipRRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.surface.withOpacity(0.4),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const SmallMenu(),
        ),
      ),
    );
  }
}

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  FutureOr<bool> build() => false; // مغلق افتراضيًا

  void open() => state = const AsyncData(true);
  void close() => state = const AsyncData(false);
  void toggle() => state = AsyncData(!(state.value ?? false));
}
