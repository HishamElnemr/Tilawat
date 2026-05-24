import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';
import 'package:tilawat/core/widgets/play_icon.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_latest_recitations_listview.dart';

class RecitationItem extends StatelessWidget {
  const RecitationItem({super.key, required this.data});

  final RecitationData data;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Row(
        children: [
          PlayIcon(colorScheme: colorScheme, size: 34),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.title,
                  style: AppStyles.body1SemiBold16(context).copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 16),
                    color: colorScheme.onSurface,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.reciter,
                  style: AppStyles.body2Regular14(context).copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 12),
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            data.duration,
            style: AppStyles.body2Medium14(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 12),
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
