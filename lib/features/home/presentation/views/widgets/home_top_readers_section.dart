import 'package:flutter/material.dart';
import 'package:tilawat/core/widgets/section_header.dart';
import 'package:tilawat/features/home/presentation/views/widgets/home_top_readers_listview.dart';

class HomeTopReadersSection extends StatelessWidget {
  const HomeTopReadersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SectionHeader(title: 'أهم القراء'),
        ),
        SizedBox(height: 12),
        HomeTopReadersListView(),
      ],
    );
  }
}
