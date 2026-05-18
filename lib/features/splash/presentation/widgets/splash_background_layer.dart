import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_images.dart';

class SplashBackgroundLayer extends StatelessWidget {
  const SplashBackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF050D08), 
                Color(0xFF0D1F15), 
                Color(0xFF172E1F), 
                Color(0xFF2C5039), 
                Color(0xFF3A6347), 
                Color(0xFF4A7558), 
                Color(0xFF0D1F15), 
                Color(0xFF050D08), 
              ],
              stops: [0.0, 0.15, 0.32, 0.58, 0.65, 0.75, 0.95, 1],
            ),
          ),
        ),

        Opacity(
          opacity: 0.02,
          child: Image.asset(
            Assets.assetsImagesBg01,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.0, -0.8),
              radius: 1.1,
              colors: [
                const Color(0xFF14321E).withValues(alpha: 0.0),
                const Color(0xFF050D08).withValues(alpha: 0.55),
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),       
      ],
    );
  }
}
