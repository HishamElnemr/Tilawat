import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/services/getit_services.dart';
import 'package:tilawat/core/widgets/custom_main_app_bar.dart';
import 'package:tilawat/features/dashboard/domain/repos/upload_data_repo.dart';
import 'package:tilawat/features/dashboard/presentation/cubits/upload_data_cubit.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomMainAppBar(title: 'لوحة التحكم', showAction: true),
      body: BlocProvider(
        create: (context) => UploadDataCubit(getIt.get<UploadDataRepo>()),
        child: const DashboardViewBody(),
      ),
    );
  }
}
