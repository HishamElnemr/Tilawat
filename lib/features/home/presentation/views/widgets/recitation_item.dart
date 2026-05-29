import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/utils/app_styles.dart';
import 'package:tilawat/features/home/presentation/views/widgets/recitation_play_button_bloc_builder.dart';
import 'package:tilawat/features/tilawah/domain/entities/tilawah_entity.dart';
import 'package:tilawat/features/tilawah/presentation/cubit_player/cubit_player.dart';

class RecitationItem extends StatelessWidget {
  const RecitationItem({super.key, required this.tilawahEntity});

  final TilawahEntity tilawahEntity;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final playerCubit = context.read<CubitPlayer>();

    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Row(
        children: [
          RecitationPlayButtonBlocBuilder(
            audioUrl: tilawahEntity.audioUrl,
            onPlay: () => playerCubit.playAudio(tilawahEntity.audioUrl),
            onPause: playerCubit.pauseAudio,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tilawahEntity.surahName,
                  style: AppStyles.body1SemiBold16(context).copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 16),
                    color: colorScheme.onSurface,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  tilawahEntity.reciters.join(' - '),
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
            '18:25',
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
