part of 'cubit_player.dart';

@immutable
sealed class CubitPlayerState {}

final class CubitPlayerInitial extends CubitPlayerState {}

final class CubitPlayerLoading extends CubitPlayerState {
  final String url;

  CubitPlayerLoading(this.url);
}

final class CubitPlayerSuccess extends CubitPlayerState {
  final String url;

  CubitPlayerSuccess(this.url);
}

final class CubitPlayerPaused extends CubitPlayerState {
  final String url;

  CubitPlayerPaused(this.url);
}

final class CubitPlayerFailure extends CubitPlayerState {
  final String errMessage;

  CubitPlayerFailure(this.errMessage);
}
