import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardDescriptionField extends StatelessWidget {
  const DashboardDescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.onSurface.withValues(alpha: 0.72);
    final fillColor = Color.alphaBlend(
      colorScheme.outline.withValues(alpha: 0.22),
      colorScheme.surface,
    );
    final borderRadius = BorderRadius.circular(20);

    return TextFormField(
      minLines: 5,
      maxLines: null,
      style: AppStyles.body2Regular14(context).copyWith(
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        color: colorScheme.onSurface,
        height: 1.5,
      ),
      decoration: InputDecoration(
        hintText: 'أدخل وصف التلاوة... إن وُجد',
        hintStyle: AppStyles.body2Regular14(context).copyWith(
          fontSize: getResponsiveFontSize(context, fontSize: 15),
          color: iconColor,
          height: 1.5,
        ),
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
      ),
    );
  }
}
