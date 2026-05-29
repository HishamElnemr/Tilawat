import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_latest_recitations_listview.dart';
import 'package:tilawat/features/tilawah/presentation/tilawah_cubit/tilawah_cubit.dart';
import 'package:tilawat/features/tilawah/presentation/tilawah_cubit/tilawah_states.dart';

class RecitationsSectionBlocBuilder extends StatelessWidget {
  const RecitationsSectionBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TilawahCubit, TilawahStates>(
      builder: (context, state) {
        if (state is TilawahLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TilawahSuccess) {
          return HomeLatestRecitationsListView(
            tilawahEntity: state.recitations,
          );
        } else if (state is TilawahFailure) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
