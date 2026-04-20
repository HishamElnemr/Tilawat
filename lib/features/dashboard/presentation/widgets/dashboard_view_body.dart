import 'package:flutter/material.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_form_card.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_logout_button.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_welcome_card.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
      child: Center(
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DashboardWelcomeCard(),
            SizedBox(height: 20),
            DashboardFormCard(),
            SizedBox(height: 20),
            DashboardLogoutButton(),
          ],
        ),
      ),
    );
  }
}
