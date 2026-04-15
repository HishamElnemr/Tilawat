import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardSubmitButton extends StatelessWidget {
  const DashboardSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'إضافة التلاوة',
              style: AppStyles.button1SemiBold16(context).copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
