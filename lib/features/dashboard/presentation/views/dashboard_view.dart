import 'package:flutter/material.dart';
import 'package:tilawat/core/widgets/custom_main_app_bar.dart';
import 'package:tilawat/features/dashboard/presentation/views/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomMainAppBar(title: 'لوحة التحكم'),
      body: const DashboardViewBody(),
    );
  }
}
