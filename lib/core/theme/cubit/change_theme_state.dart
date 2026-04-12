import 'package:flutter/material.dart';

@immutable
sealed class ChangeThemeState {}

final class ChangeThemeInitial extends ChangeThemeState {}

final class ChangeThemeToLight extends ChangeThemeState {
  final ThemeData theme;
  ChangeThemeToLight(this.theme);
}

final class ChangeThemeToDark extends ChangeThemeState {
  final ThemeData theme;
  ChangeThemeToDark(this.theme);
}
