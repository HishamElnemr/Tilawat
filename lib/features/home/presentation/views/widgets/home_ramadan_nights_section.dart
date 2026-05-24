import 'package:flutter/material.dart';
import 'package:tilawat/core/widgets/section_header.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_ramadan_nights_listview.dart';

class HomeRamadanNightsSection extends StatelessWidget {
  const HomeRamadanNightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SectionHeader(title: 'ليالي رمضان'),
        ),
        SizedBox(height: 12),
        HomeRamadanNightsListView(),
      ],
    );
  }
}
