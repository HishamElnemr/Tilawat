import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/services/audio_services.dart';
import 'package:tilawat/core/services/getit_services.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:tilawat/features/tilawah/domain/repos/tilawah_repo.dart';
import 'package:tilawat/features/tilawah/presentation/cubit_player/cubit_player.dart';
import 'package:tilawat/features/tilawah/presentation/tilawah_cubit/tilawah_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TilawahCubit(getIt<TilawahRepo>())..getRecitations(),
        ),
        BlocProvider(
          create: (context) =>
              CubitPlayer(audioServices: getIt<AudioServices>()),
        ),
      ],
      child: const Scaffold(appBar: HomeAppBar(), body: HomeViewBody()),
    );
  }
}
