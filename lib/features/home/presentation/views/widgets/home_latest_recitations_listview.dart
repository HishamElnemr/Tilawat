import 'package:flutter/material.dart';
import 'package:tilawat/features/home/presentation/views/widgets/recitation_item.dart';
import 'package:tilawat/features/tilawah/domain/entities/tilawah_entity.dart';

class HomeLatestRecitationsListView extends StatelessWidget {
  const HomeLatestRecitationsListView({super.key, required this.tilawahEntity});

  final List<TilawahEntity> tilawahEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        itemCount: tilawahEntity.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return RecitationItem(tilawahEntity: tilawahEntity[index]);
        },
      ),
    );
  }
}
