import 'package:flutter/material.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_latest_recitations_section.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_ramadan_nights_section.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_top_readers_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HomeTopReadersSection(),
          SizedBox(height: 12),
          HomeLatestRecitationsSection(),
          SizedBox(height: 12),
          HomeRamadanNightsSection(),
        ],
      ),
    );
  }
}
