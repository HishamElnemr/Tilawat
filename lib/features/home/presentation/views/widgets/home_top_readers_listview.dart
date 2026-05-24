import 'package:flutter/material.dart';
import 'package:tilawat/features/home/presentation/views/widgets/reader_item.dart';

class HomeTopReadersListView extends StatelessWidget {
  const HomeTopReadersListView({super.key});

  static const List<String> _readers = [
    'ياسر الدوسري',
    'ماهر المعيقلي',
    'محمد صديق المنشاوي',
    'عبد الباسط عبد الصمد',
    'عبد الباسط عبد الصمد',
    'عبد الباسط عبد الصمد',
    'عبد الباسط عبد الصمد',
  ];

  static const double _listHeight = 108;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _listHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _readers.length,
        itemBuilder: (context, index) {
          return ReaderItem(name: _readers[index]);
        },
      ),
    );
  }
}
