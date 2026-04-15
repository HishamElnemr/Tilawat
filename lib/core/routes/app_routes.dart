import 'package:flutter/material.dart';
import 'package:tilawat/core/routes/routes_name.dart';
import 'package:tilawat/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:tilawat/features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashView());

      case RoutesName.dashboard:
        return MaterialPageRoute(builder: (context) => DashboardView());

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
