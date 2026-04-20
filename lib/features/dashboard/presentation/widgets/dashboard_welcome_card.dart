import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_images.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardWelcomeCard extends StatelessWidget {
  const DashboardWelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(Assets.assetsImagesBg01),
          fit: BoxFit.cover,
          opacity: 0.04,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryContainer,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مرحباً بك',
            style: AppStyles.heading3Bold18(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(height: 6),
          Text(
            'قم بإضافة تلاوة جديدة للتطبيق',
            style: AppStyles.body2Regular14(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 15),
              color: Theme.of(context).colorScheme.onPrimary,
              height: 1.75,
            ),
          ),
        ],
      ),
    );
  }
}
