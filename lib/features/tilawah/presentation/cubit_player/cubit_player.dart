import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/services/audio_services.dart';

part 'cubit_player_state.dart';

class CubitPlayer extends Cubit<CubitPlayerState> {
  CubitPlayer({required AudioServices audioServices})
    : _audioServices = audioServices,
      super(CubitPlayerInitial());

  final AudioServices _audioServices;
  String? _currentUrl;

  Future<void> playAudio(String url) async {
    _currentUrl = url;
    emit(CubitPlayerLoading(url));
    try {
      await _audioServices.playAudio(url);
      emit(CubitPlayerSuccess(url));
    } catch (e) {
      emit(CubitPlayerFailure('Error playing audio: $e'));
    }
  }

  Future<void> pauseAudio() async {
    try {
      await _audioServices.pauseAudio();
      final url = _currentUrl;
      if (url != null) {
        emit(CubitPlayerPaused(url));
      }
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }
}
