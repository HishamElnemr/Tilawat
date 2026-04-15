import 'package:flutter/material.dart';

class SplashBackgroundLayer extends StatelessWidget {
  const SplashBackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0, -0.1),
              radius: 1.05,
              colors: [
                const Color(0xFF0E6B47).withValues(alpha: 0.9),
                const Color(0xFF003B2E),
                const Color(0xFF01251E),
              ],
              stops: const [0.0, 0.65, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}
