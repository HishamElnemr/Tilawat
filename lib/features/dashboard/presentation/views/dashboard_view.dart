import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/services/getit_services.dart';
import 'package:tilawat/core/widgets/custom_main_app_bar.dart';
import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';
import 'package:tilawat/features/dashboard/domain/repos/upload_data_repo.dart';
import 'package:tilawat/features/dashboard/presentation/cubits/upload_data_cubit.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key, required this.token});

  final LoginResponseEntity token;

  @override
  Widget build(BuildContext context) {
    log('[DASHBOARD][VIEW] opened with token=${_maskToken(token.token)}');
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomMainAppBar(title: 'لوحة التحكم', showAction: true),
      body: BlocProvider(
        create: (context) => UploadDataCubit(getIt.get<UploadDataRepo>()),
        child: DashboardViewBody(token: token),
      ),
    );
  }
}

String _maskToken(String token) {
  if (token.length <= 10) {
    return '***';
  }
  return '${token.substring(0, 6)}...${token.substring(token.length - 4)}';
}
