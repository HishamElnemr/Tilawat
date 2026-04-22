import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardUploadSuccessState extends StatelessWidget {
  const DashboardUploadSuccessState({
    super.key,
    required this.fileName,
    required this.colorScheme,
    required this.onPickAudio,
    required this.onRemoveFile,
  });

  final String fileName;
  final ColorScheme colorScheme;
  final VoidCallback onPickAudio;
  final VoidCallback onRemoveFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.audio_file,
          size: 32,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 8),
        Text(
          fileName,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.body1SemiBold16(context).copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 15),
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: onPickAudio,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'تغيير',
                style: AppStyles.captionRegular12(context).copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              ' | ',
              style: AppStyles.captionRegular12(context).copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            TextButton(
              onPressed: onRemoveFile,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'حذف',
                style: AppStyles.captionRegular12(context).copyWith(
                  color: colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
