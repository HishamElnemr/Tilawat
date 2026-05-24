import 'package:flutter/material.dart';
import 'package:tilawat/features/home/presentation/views/widgets/ramadan_night_item.dart';

class HomeRamadanNightsListView extends StatelessWidget {
  const HomeRamadanNightsListView({super.key});

  static const List<RamadanNightData> _items = [
    RamadanNightData(
      title: 'ليلة 27 رمضان',
      location: 'المسجد الحرام',
      reciters: ['عمار المعمري', 'عبد الرحمن السديس'],
      duration: '3:25:00',
    ),
    RamadanNightData(
      title: 'ليلة 17 رمضان',
      location: 'المسجد النبوي',
      reciters: ['باسل السومري'],
      duration: '2:15:30',
    ),
    RamadanNightData(
      title: 'ليلة 21 رمضان',
      location: 'المسجد الحرام',
      reciters: ['عبد الرحمن السديس'],
      duration: '2:40:10',
    ),
  ];

  static const double _listHeight = 150;
  static const double _itemSpacing = 12;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _listHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _items.length,
        separatorBuilder: (_, _) => const SizedBox(width: _itemSpacing),
        itemBuilder: (context, index) {
          return RamadanNightItem(data: _items[index]);
        },
      ),
    );
  }
}
