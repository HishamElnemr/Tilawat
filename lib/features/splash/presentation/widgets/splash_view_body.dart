import 'package:flutter/material.dart';
import 'package:tilawat/features/splash/presentation/widgets/splash_background_layer.dart';
import 'package:tilawat/features/splash/presentation/widgets/splash_content_section.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: const [
        SplashBackgroundLayer(),
        SafeArea(child: SplashContentSection()),
      ],
    );
  }
}
