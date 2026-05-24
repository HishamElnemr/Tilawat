import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.onActionTap});

  final String title;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Container(
                width: 3,
                height: 20,
                decoration: ShapeDecoration(
                  color: colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.heading2Bold24(context).copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 16),
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              'عرض الكل',
              style: AppStyles.button2SemiBold14(context).copyWith(
                fontSize: getResponsiveFontSize(context, fontSize: 14),
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ],
        ),
      ],
    );
  }
}
