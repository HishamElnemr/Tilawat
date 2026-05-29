import 'package:just_audio/just_audio.dart';

class AudioServices {
  final _player = AudioPlayer();

  Future<void> playAudio(String url) async {
    try {
      await _player.setUrl(url);
      _player.play();
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

   Future<void> pauseAudio() async {
    try {
      await _player.pause();
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }


}
