import 'package:flutter/material.dart';
import 'package:tilawat/features/home/presentation/views/widgets/recitation_item.dart';

class HomeLatestRecitationsListView extends StatelessWidget {
  const HomeLatestRecitationsListView({super.key});

  static const List<RecitationData> _items = [
    RecitationData(
      title: 'سورة البقرة',
      reciter: 'عبد الباسط عبد الصمد',
      duration: '2:45:30',
    ),
    RecitationData(
      title: 'سورة آل عمران',
      reciter: 'محمد صديق المنشاوي',
      duration: '1:58:20',
    ),
    RecitationData(
      title: 'سورة يس',
      reciter: 'ماهر المعيقلي',
      duration: '18:45',
    ),
    RecitationData(
      title: 'سورة الرحمن',
      reciter: 'ياسر الدوسري',
      duration: '15:30',
    ),
    RecitationData(
      title: 'سورة الواقعة',
      reciter: 'مشاري راشد العفاسي',
      duration: '21:12',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        itemCount: _items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return RecitationItem(data: _items[index]);
        },
      ),
    );
  }
}

class RecitationData {
  const RecitationData({
    required this.title,
    required this.reciter,
    required this.duration,
  });

  final String title;
  final String reciter;
  final String duration;
}
