import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardSectionLabel extends StatelessWidget {
  const DashboardSectionLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: AppStyles.body1SemiBold16(context).copyWith(
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
