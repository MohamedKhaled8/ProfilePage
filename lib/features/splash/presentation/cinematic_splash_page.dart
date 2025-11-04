import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_website/core/routes/routes.dart';
import 'package:video_player/video_player.dart';

class CinematicSplashPage extends StatefulWidget {
  const CinematicSplashPage({super.key});

  @override
  State<CinematicSplashPage> createState() => _CinematicSplashPageState();
}

class _CinematicSplashPageState extends State<CinematicSplashPage>
    with TickerProviderStateMixin {
  late final AnimationController _titleController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900 + 1200 + 800),
  );
  late final Animation<double> _titleOpacity = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 900,
    ),
    TweenSequenceItem(tween: ConstantTween(1.0), weight: 1200),
    TweenSequenceItem(
      tween: Tween(
        begin: 1.0,
        end: 0.0,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 800,
    ),
  ]).animate(_titleController);

  // phrases timing
  static const int _fadeInMs = 700;
  static const int _holdMs = 2200;
  static const int _fadeOutMs = 700;
  static const int _overlapMs = 200; // next starts early

  final List<String> _phrases = const [
    'Im Mohamed Khaled',
    'a Mobile Developer.',
    'a Flutter Engineer.',
  ];

  int _currentIndex = -1; // -1 means show title
  int _nextIndex = -1;
  double _currentOpacity = 0;
  double _nextOpacity = 0;

  VideoPlayerController? _video;
  bool _videoError = false;
  Timer? _seqTimer;
  bool _skipped = false;

  bool get _reduceMotion => WidgetsBinding
      .instance
      .platformDispatcher
      .accessibilityFeatures
      .reduceMotion;

  @override
  void initState() {
    super.initState();
    _initVideo();
    _startSequence();
  }

  Future<void> _initVideo() async {
    try {
      final controller = VideoPlayerController.asset('assets/video/world.mp4');
      _video = controller;
      await controller.initialize();
      controller.setLooping(true); // loop video until text sequence finishes
      controller.setVolume(0.0); // muted
      unawaited(controller.play());
      if (mounted) setState(() {});
    } catch (_) {
      _videoError = true;
      if (mounted) setState(() {});
    }
  }

  void _startSequence() {
    if (_reduceMotion) {
      // Respect reduced motion: quick jump
      WidgetsBinding.instance.addPostFrameCallback((_) => _goHome());
      return;
    }

    _titleController.forward();
    _currentIndex = -1;
    _currentOpacity = 1;
    setState(() {});

    final int titleTotal = 900 + 1200 + 800;
    _seqTimer = Timer(Duration(milliseconds: titleTotal), _startPhrases);
  }

  void _startPhrases() {
    if (!mounted || _skipped) return;
    _currentIndex = 0;
    _currentOpacity = 0;
    setState(() {});

    _fadeInCurrent();
  }

  void _fadeInCurrent() {
    if (!mounted || _skipped) return;
    _animateOpacity(targetCurrent: 1, targetNext: 0, ms: _fadeInMs).then((_) {
      if (!mounted || _skipped) return;
      // hold
      _seqTimer = Timer(Duration(milliseconds: _holdMs - _overlapMs), () {
        if (!mounted || _skipped) return;
        _startCrossfadeToNext();
      });
    });
  }

  void _startCrossfadeToNext() {
    if (!mounted || _skipped) return;
    final bool hasNext = _currentIndex + 1 < _phrases.length;
    if (!hasNext) {
      // fade out last, then go home
      _animateOpacity(targetCurrent: 0, targetNext: 0, ms: _fadeOutMs).then((
        _,
      ) {
        if (!mounted || _skipped) return;
        _goHome();
      });
      return;
    }

    _nextIndex = _currentIndex + 1;
    _nextOpacity = 0;
    setState(() {});

    // overlap: start next fade-in while current starts fade-out
    _animateOpacity(targetCurrent: 0, targetNext: 1, ms: _fadeOutMs).then((_) {
      if (!mounted || _skipped) return;
      // switch to next as current
      _currentIndex = _nextIndex;
      _nextIndex = -1;
      _currentOpacity = 1;
      _nextOpacity = 0;
      setState(() {});
      // hold then continue
      _seqTimer = Timer(Duration(milliseconds: _holdMs - _overlapMs), () {
        if (!mounted || _skipped) return;
        _startCrossfadeToNext();
      });
    });
  }

  Future<void> _animateOpacity({
    required double targetCurrent,
    required double targetNext,
    required int ms,
  }) async {
    final int steps = 18; // leaner, still smooth
    final Duration frame = Duration(milliseconds: (ms / steps).round());
    final double startCurrent = _currentOpacity;
    final double startNext = _nextOpacity;
    for (int i = 1; i <= steps; i++) {
      if (!mounted || _skipped) return;
      final t = Curves.easeInOut.transform(i / steps);
      _currentOpacity = startCurrent + (targetCurrent - startCurrent) * t;
      _nextOpacity = startNext + (targetNext - startNext) * t;
      setState(() {});
      await Future<void>.delayed(frame);
    }
  }

  void _goHome() {
    if (!mounted) return;
    context.go(Routes.home);
  }

  @override
  void dispose() {
    _seqTimer?.cancel();
    _titleController.dispose();
    _video?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    final double titleFontSize = _clamp(size.width * 0.08, min: 32, max: 96);
    final double phraseFontSize = _clamp(size.width * 0.06, min: 28, max: 72);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _skipped = true;
        _goHome();
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Video background or fallback
            _buildBackground(),

            // centered overlays
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Initial title
                  FadeTransition(
                    opacity: _titleOpacity,
                    child: _SplashText(
                      'Hello Welcome',
                      fontSize: titleFontSize,
                    ),
                  ),

                  // Phrase crossfades (stacked to overlap)
                  if (_currentIndex >= 0)
                    SizedBox(
                      height: phraseFontSize * 1.4,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Opacity(
                            opacity: _currentOpacity,
                            child: _SplashText(
                              _phrases[_currentIndex],
                              fontSize: phraseFontSize,
                            ),
                          ),
                          if (_nextIndex >= 0)
                            Opacity(
                              opacity: _nextOpacity,
                              child: _SplashText(
                                _phrases[_nextIndex],
                                fontSize: phraseFontSize,
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Skip button
            Positioned(
              top: 16,
              right: 16,
              child: _SkipButton(
                onPressed: () {
                  _skipped = true;
                  _goHome();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    final controller = _video;
    if (controller != null && controller.value.isInitialized && !_videoError) {
      return FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: controller.value.size.width,
          height: controller.value.size.height,
          child: VideoPlayer(controller),
        ),
      );
    }
    return const ColoredBox(color: Colors.black);
  }

  double _clamp(double v, {required double min, required double max}) {
    return v.clamp(min, max).toDouble();
  }
}

class _SplashText extends StatelessWidget {
  const _SplashText(this.text, {required this.fontSize});
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        letterSpacing: 1.0,
        shadows: const [
          Shadow(color: Color(0x33000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.25),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: const Text('Skip'),
    );
  }
}
