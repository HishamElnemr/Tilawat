import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/features/tilawah/presentation/cubits/tilawah_cubit.dart';
import 'package:tilawat/features/tilawah/presentation/cubits/tilawah_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tilawah Test')),
      body: BlocBuilder<TilawahCubit, TilawahStates>(
        builder: (context, state) {
          if (state is TilawahLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TilawahFailure) {
            return Center(child: Text(state.message));
          }

          if (state is TilawahSuccess) {
            if (state.recitations.isEmpty) {
              return const Center(child: Text('No recitations found'));
            }

            return RefreshIndicator(
              onRefresh: context.read<TilawahCubit>().getRecitations,
              child: ListView.separated(
                itemCount: state.recitations.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = state.recitations[index];
                  return ListTile(
                    title: Text(item.surahName),
                    subtitle: Text(item.reciters.join(', ')),
                    trailing: item.isRamadan
                        ? const Icon(Icons.nightlight_round)
                        : null,
                  );
                },
              ),
            );
          }

          return Center(
            child: ElevatedButton(
              onPressed: context.read<TilawahCubit>().getRecitations,
              child: const Text('Load Recitations'),
            ),
          );
        },
      ),
    );
  }
}
