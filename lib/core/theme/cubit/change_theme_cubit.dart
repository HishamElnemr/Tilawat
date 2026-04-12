import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/theme/app_theme.dart';
import 'package:tilawat/core/theme/cubit/change_theme_state.dart';
import 'package:tilawat/core/utils/shared_prefs.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial()) {
    _loadTheme();
  }

  Future<void> toggleTheme() async {
    SharedPrefs.setBool('isDark', ThemeMode.system == ThemeMode.dark);
    if (state is ChangeThemeToLight) {
      emit(ChangeThemeToDark(AppTheme.darkTheme));
      SharedPrefs.setBool('isDark', true);
    } else if (state is ChangeThemeToDark) {
      emit(ChangeThemeToLight(AppTheme.lightTheme));
      SharedPrefs.setBool('isDark', false);
    }
  }

  Future<void> _loadTheme() async {
    final isDark = SharedPrefs.getBool('isDark');
    if (isDark) {
      emit(ChangeThemeToDark(AppTheme.darkTheme));
    } else {
      emit(ChangeThemeToLight(AppTheme.lightTheme));
    }
  }
}
