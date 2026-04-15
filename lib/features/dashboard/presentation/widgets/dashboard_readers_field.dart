import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardReadersField extends StatelessWidget {
  const DashboardReadersField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 43,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: Color.alphaBlend(
                Theme.of(context).colorScheme.outline.withValues(alpha: 0.22),
                Theme.of(context).colorScheme.surface,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            child: Text(
              'أدخل اسم القارئ',
              textAlign: TextAlign.right,
              style: AppStyles.body2Regular14(context).copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.72),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color.alphaBlend(
              Theme.of(context).colorScheme.outline.withValues(alpha: 0.22),
              Theme.of(context).colorScheme.surface,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.add,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.72),
            size: 20,
          ),
        ),
      ],
    );
  }
}
