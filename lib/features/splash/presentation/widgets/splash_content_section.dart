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
            Image.asset(Assets.assetsImagesLogoMain, width: 136, height: 136),
            const SizedBox(height: 18),
            Text(
              'تـلاوات',
              style: AppStyles.reemHeading28(context).copyWith(
                color: const Color(0xFFF4F5F4),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            SvgPicture.asset(Assets.assetsImagesSplashShape01, width: 120),
            const SizedBox(height: 12),
            Text(
              'كفر بهيدة',
              style: AppStyles.reemHeading24(context).copyWith(
                color: const Color(0xFFDCE6E0),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
