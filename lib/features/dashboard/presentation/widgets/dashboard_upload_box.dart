import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardUploadBox extends StatelessWidget {
  const DashboardUploadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 143,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Color.alphaBlend(
          Theme.of(context).colorScheme.outline.withValues(alpha: 0.22),
          Theme.of(context).colorScheme.surface,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.file_upload_outlined,
            size: 32,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.72),
          ),
          const SizedBox(height: 8),
          Text(
            'اضغط لرفع ملف صوتي',
            textAlign: TextAlign.center,
            style: AppStyles.body1SemiBold16(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 15),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'MP3, WAV, OGG, M4A',
            textAlign: TextAlign.center,
            style: AppStyles.captionRegular12(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 13),
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.65),
            ),
          ),
        ],
      ),
    );
  }
}
