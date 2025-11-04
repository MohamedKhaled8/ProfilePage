import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:my_website/core/routes/routes.dart';
import 'package:my_website/features/home/presentation/home_page.dart';
import 'package:my_website/features/profile/presentation/about_bage.dart';
import 'package:my_website/features/splash/presentation/cinematic_splash_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const CinematicSplashPage()),
      ),
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 600),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: Routes.aboutMe,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const AboutPage()),
      ),
    ],
  );
}
