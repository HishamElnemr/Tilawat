import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardUploadDefaultState extends StatelessWidget {
  const DashboardUploadDefaultState({super.key, required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.file_upload_outlined,
          size: 32,
          color: colorScheme.onSurface.withValues(alpha: 0.72),
        ),
        const SizedBox(height: 8),
        Text(
          'اضغط لرفع ملف صوتي',
          textAlign: TextAlign.center,
          style: AppStyles.body1SemiBold16(context).copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 15),
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'MP3, WAV, OGG, M4A',
          textAlign: TextAlign.center,
          style: AppStyles.captionRegular12(context).copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 13),
            color: colorScheme.onSurface.withValues(alpha: 0.65),
          ),
        ),
      ],
    );
  }
}
