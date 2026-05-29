import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/features/home/presentation/views/widgets/recitation_play_button.dart';
import 'package:tilawat/features/tilawah/presentation/cubit_player/cubit_player.dart';

class RecitationPlayButtonBlocBuilder extends StatelessWidget {
  const RecitationPlayButtonBlocBuilder({
    super.key,
    required this.audioUrl,
    required this.onPlay,
    required this.onPause,
  });

  final String audioUrl;
  final VoidCallback onPlay;
  final VoidCallback onPause;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitPlayer, CubitPlayerState>(
      builder: (context, state) {
        var isLoading = false;
        var isPlaying = false;

        if (state is CubitPlayerLoading) {
          isLoading = state.url == audioUrl;
        } else if (state is CubitPlayerSuccess) {
          isPlaying = state.url == audioUrl;
        } else if (state is CubitPlayerPaused) {
          isPlaying = false;
        }
        else if (state is CubitPlayerFailure) {
          isLoading = false;
          isPlaying = false;
        }

        return RecitationPlayButton(
          isLoading: isLoading,
          isPlaying: isPlaying,
          onPlay: onPlay,
          onPause: onPause,
        );
      },
    );
  }
}
