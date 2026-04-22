import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardToggleButton extends StatelessWidget {
  const DashboardToggleButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 43,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary
                : Color.alphaBlend(
                    colorScheme.outline.withValues(alpha: 0.22),
                    colorScheme.surface,
                  ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline,
            ),
          ),
          child: Text(
            label,
            style: AppStyles.button2SemiBold14(context).copyWith(
              color: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
