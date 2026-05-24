import 'package:flutter/material.dart';
import 'package:tilawat/core/routes/routes_name.dart';
import 'package:tilawat/features/splash/presentation/widgets/splash_background_layer.dart';
import 'package:tilawat/features/splash/presentation/widgets/splash_content_section.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, RoutesName.home);
    });
  }

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
