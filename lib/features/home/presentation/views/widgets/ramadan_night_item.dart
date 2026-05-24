import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class RamadanNightData {
  const RamadanNightData({
    required this.title,
    required this.location,
    required this.reciters,
    required this.duration,
  });

  final String title;
  final String location;
  final List<String> reciters;
  final String duration;
}

class RamadanNightItem extends StatelessWidget {
  const RamadanNightItem({super.key, required this.data});

  final RamadanNightData data;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 170,
      child: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 10),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              textAlign: TextAlign.start,
              style: AppStyles.body1SemiBold16(context).copyWith(
                fontSize: getResponsiveFontSize(context, fontSize: 14),
                color: colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data.location,
              textAlign: TextAlign.start,
              style: AppStyles.body2Regular14(context).copyWith(
                fontSize: getResponsiveFontSize(context, fontSize: 12),
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 8),
            ...data.reciters.map(
              (reciter) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: _ReciterRow(name: reciter),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PlayButton(
                  backgroundColor: colorScheme.primary,
                  iconColor: colorScheme.onPrimary,
                ),
                Text(
                  data.duration,
                  style: AppStyles.body2Medium14(context).copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 12),
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReciterRow extends StatelessWidget {
  const _ReciterRow({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          name,
          textAlign: TextAlign.start,
          style: AppStyles.body2Regular14(context).copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 12),
            color: colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.backgroundColor, required this.iconColor});

  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Icon(Icons.play_arrow_rounded, color: iconColor, size: 18),
    );
  }
}
