import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_images.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class ReaderItem extends StatelessWidget {
  const ReaderItem({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 78,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.secondary, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                Assets.assetsImagesLogoMain,
                width: 52,
                height: 52,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.body2Regular14(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 12),
              color: colorScheme.onSurface,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
