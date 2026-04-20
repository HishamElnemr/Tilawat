import 'package:flutter/material.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_readers_row.dart';

class DashboardReadersListView extends StatefulWidget {
  const DashboardReadersListView({super.key});

  @override
  State<DashboardReadersListView> createState() => _DashboardReadersListViewState();
}

class _DashboardReadersListViewState extends State<DashboardReadersListView> {
  final List<TextEditingController> _controllers = [TextEditingController()];

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addReader() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeReader(int index) {
    setState(() {
      _controllers[index].dispose();
      _controllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _controllers.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index < _controllers.length - 1 ? 8 : 0,
          ),
          child: DashboardReadersRow(
            controller: _controllers[index],
            onTap: _addReader,
            onDelete: () => _removeReader(index),
            showDelete: _controllers.length > 1,
          ),
        );
      },
    );
  }
}
