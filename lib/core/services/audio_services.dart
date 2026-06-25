import 'dart:developer';

import 'package:just_audio/just_audio.dart';

class AudioServices {
  final _player = AudioPlayer();

  Future<void> playAudio(String url) async {
    try {
      await _player.setUrl(url);
      _player.play();
    } catch (e) {
      log('Error playing audio: $e');
    }
  }


  Future<void> pauseAudio() async {
    try {
      await _player.pause();
    } catch (e) {
      log('Error pausing audio: $e');
    }
  }

  Future<void> stopAudio() async {
    try {
      await _player.stop();
    } catch (e) {
      log('Error stopping audio: $e');
    }
  }

  Future<void> dispose() async {
    await _player.dispose();
  }
}
