import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardDropdownField extends StatelessWidget {
  const DashboardDropdownField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Color.alphaBlend(
          Theme.of(context).colorScheme.outline.withValues(alpha: 0.22),
          Theme.of(context).colorScheme.surface,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Text(
        hintText,
        textAlign: TextAlign.right,
        style: AppStyles.body1Medium16(context).copyWith(
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
