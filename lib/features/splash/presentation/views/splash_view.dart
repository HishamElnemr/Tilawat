import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/theme/cubit/change_theme_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: context.read<ChangeThemeCubit>().toggleTheme,
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
