import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardRamadanYearField extends StatelessWidget {
  const DashboardRamadanYearField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.onSurface.withValues(alpha: 0.72);
    final borderRadius = BorderRadius.circular(16);
    final fillColor = Color.alphaBlend(
      colorScheme.outline.withValues(alpha: 0.22),
      colorScheme.surface,
    );

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: AppStyles.body2Regular14(context).copyWith(
        color: colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: 'عام (1445) ه',
        hintStyle: AppStyles.body2Regular14(context).copyWith(
          color: iconColor,
        ),
        filled: true,
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
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
      ),
    );
  }
}
