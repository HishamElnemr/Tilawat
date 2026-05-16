import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/routes/routes_name.dart';
import 'package:tilawat/core/services/getit_services.dart';
import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';
import 'package:tilawat/features/auth/domain/repos/auth_repo.dart';
import 'package:tilawat/features/auth/presentation/cubits/login_cubit.dart';
import 'package:tilawat/features/auth/presentation/views/auth_view.dart';
import 'package:tilawat/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:tilawat/features/home/presentation/views/home_view.dart';
import 'package:tilawat/features/splash/presentation/views/splash_view.dart';
import 'package:tilawat/features/tilawah/domain/repos/tilawah_repo.dart';
import 'package:tilawat/features/tilawah/presentation/cubits/tilawah_cubit.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashView());

      case RoutesName.auth:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt.get<AuthRepo>()),
            child: const AuthView(),
          ),
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                TilawahCubit(getIt.get<TilawahRepo>())..getRecitations(),
            child: const HomeView(),
          ),
        );

      case RoutesName.dashboard:
        final args = settings.arguments;
        if (args is! LoginResponseEntity) {
          log(
            '[ROUTES] Dashboard opened without LoginResponseEntity args, redirecting to AuthView',
          );
          return MaterialPageRoute(builder: (context) => const AuthView());
        }
        log('[ROUTES] Dashboard args received token=${_maskToken(args.token)}');
        return MaterialPageRoute(
          builder: (context) => DashboardView(token: args),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(child: Text('No Route defined')),
            );
          },
        );
    }
  }
}

String _maskToken(String token) {
  if (token.length <= 10) {
    return '***';
  }
  return '${token.substring(0, 6)}...${token.substring(token.length - 4)}';
}
