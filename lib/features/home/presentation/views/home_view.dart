import 'package:flutter/material.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:tilawat/features/home/presentation/widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: HomeAppBar(), body: HomeViewBody());
  }
}
