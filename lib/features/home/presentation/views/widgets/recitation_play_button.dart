import 'package:flutter/material.dart';

class RecitationPlayButton extends StatefulWidget {
  const RecitationPlayButton({
    super.key,
    required this.isLoading,
    required this.isPlaying,
    required this.onPlay,
    required this.onPause,
  });

  final bool isLoading;
  final bool isPlaying;
  final VoidCallback onPlay;
  final VoidCallback onPause;

  @override
  State<RecitationPlayButton> createState() => _RecitationPlayButtonState();
}

class _RecitationPlayButtonState extends State<RecitationPlayButton> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: widget.isLoading
          ? null
          : (widget.isPlaying ? widget.onPause : widget.onPlay),
      customBorder: const CircleBorder(),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: widget.isLoading
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colorScheme.onPrimary,
                  ),
                )
              : Icon(
                  widget.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: colorScheme.onPrimary,
                  size: 20,
                ),
        ),
      ),
    );
  }
}
