import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({
    super.key,
    required this.colorScheme,
    required this.size,
  });

  final ColorScheme colorScheme;
  final double size ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.play_arrow_rounded,
        color: colorScheme.onPrimary,
        size: 20,
      ),
    );
  }
}
