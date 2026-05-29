import 'package:flutter/material.dart';
import 'package:tilawat/core/widgets/section_header.dart';
import 'package:tilawat/features/home/presentation/views/widgets/recitations_section_bloc_builder.dart';

class HomeLatestRecitationsSection extends StatelessWidget {
  const HomeLatestRecitationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SectionHeader(title: 'أحدث التلاوات'),
        ),
        const SizedBox(height: 12),
        RecitationsSectionBlocBuilder(),
      ],
    );
  }
}
