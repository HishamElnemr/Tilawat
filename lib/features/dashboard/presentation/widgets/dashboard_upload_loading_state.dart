import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardUploadLoadingState extends StatelessWidget {
  const DashboardUploadLoadingState({super.key, required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
          width: 32,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'جاري اختيار الملف...',
          textAlign: TextAlign.center,
          style: AppStyles.body1SemiBold16(context).copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 15),
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
