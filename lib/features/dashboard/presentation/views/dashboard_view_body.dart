import 'package:flutter/material.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_form_card.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_logout_button.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_welcome_card.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DashboardWelcomeCard(),
              SizedBox(height: 20),
              DashboardFormCard(),
              SizedBox(height: 20),
              DashboardLogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
