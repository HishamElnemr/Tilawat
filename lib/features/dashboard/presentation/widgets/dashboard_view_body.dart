import 'package:flutter/material.dart';
import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_form_card.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_logout_button.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_welcome_card.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key, required this.token});

  final LoginResponseEntity token;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DashboardWelcomeCard(),
            const SizedBox(height: 20),
            DashboardFormCard(token: token),
            const SizedBox(height: 20),
            const DashboardLogoutButton(),
          ],
        ),
      ),
    );
  }
}
