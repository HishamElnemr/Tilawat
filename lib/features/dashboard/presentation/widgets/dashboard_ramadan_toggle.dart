import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardRamadanToggle extends StatelessWidget {
  const DashboardRamadanToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _ToggleButton(label: 'نعم', isSelected: false)),
        SizedBox(width: 16),
        Expanded(child: _ToggleButton(label: 'لا', isSelected: true)),
      ],
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Color.alphaBlend(
                Theme.of(context).colorScheme.outline.withValues(alpha: 0.22),
                Theme.of(context).colorScheme.surface,
              ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline,
        ),
      ),
      child: Text(
        label,
        style: AppStyles.button2SemiBold14(context).copyWith(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
