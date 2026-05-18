import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tilawat/core/utils/app_images.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class SplashContentSection extends StatelessWidget {
  const SplashContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.assetsImagesLogoMain, width: 140, height: 140),
            const SizedBox(height: 8),
            Text(
              'تـلاوات',
              style: AppStyles.reemHeading28(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: getResponsiveFontSize(context, fontSize: 44),
                letterSpacing: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SvgPicture.asset(Assets.assetsImagesSplashShape01),
            const SizedBox(height: 8),
            Text(
              'كفر بهيدة',
              style: AppStyles.reemHeading24(context).copyWith(
                color: Colors.white.withValues(alpha: 0.9),
                fontWeight: FontWeight.normal,
                fontSize: getResponsiveFontSize(context, fontSize: 22),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
