import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/routes/app_routes.dart';
import 'package:tilawat/core/routes/routes_name.dart';
import 'package:tilawat/core/theme/app_theme.dart';
import 'package:tilawat/core/theme/cubit/change_theme_cubit.dart';
import 'package:tilawat/core/theme/cubit/change_theme_state.dart';
import 'package:tilawat/core/utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale('ar'), // Set Arabic locale
            title: 'القرآن الكريم',
            themeMode: SharedPrefs.getBool('isDark')
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
            initialRoute: RoutesName.dashboard,
          );
        },
      ),
    );
  }
}
