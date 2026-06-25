import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/services/audio_services.dart';

part 'cubit_player_state.dart';

class CubitPlayer extends Cubit<CubitPlayerState> {
  CubitPlayer({required this.audioServices}) : super(CubitPlayerInitial());

  final AudioServices audioServices;
  String? _currentUrl;

  Future<void> playAudio(String url) async {
    _currentUrl = url;
    emit(CubitPlayerLoading(url));
    try {
      await stopAudio();
      await audioServices.playAudio(url);
      emit(CubitPlayerSuccess(url));
    } catch (e) {
      emit(CubitPlayerFailure('Error playing audio: $e'));
    }
  }

  Future<void> pauseAudio() async {
    try {
      await audioServices.pauseAudio();
      final url = _currentUrl;
      if (url != null) {
        emit(CubitPlayerPaused(url));
      }
    } catch (e) {
      log('Error pausing audio: $e');
    }
  }

  Future<void> stopAudio() async {
    try {
      await audioServices.stopAudio();
      final url = _currentUrl;
      if (url != null) {
        emit(CubitPlayerStopped(url));
      }
    } catch (e) {
      log('Error stopping audio: $e');
    }
  }

  @override
  Future<void> close() {
    audioServices.dispose();
    return super.close();
  }
}
