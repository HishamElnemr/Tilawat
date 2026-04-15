import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardDescriptionField extends StatelessWidget {
  const DashboardDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 124,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        color: Color.alphaBlend(
          Theme.of(context).colorScheme.outline.withValues(alpha: 0.22),
          Theme.of(context).colorScheme.surface,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Text(
        'أدخل وصف التلاوة...',
        textAlign: TextAlign.right,
        style: AppStyles.body2Regular14(context).copyWith(
          fontSize: getResponsiveFontSize(context, fontSize: 15),
          color: Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.72),
          height: 1.5,
        ),
      ),
    );
  }
}
