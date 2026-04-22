import 'package:flutter/material.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_readers_row.dart';

class DashboardReadersListView extends StatefulWidget {
  const DashboardReadersListView({super.key, this.onChanged});

  final ValueChanged<List<String>>? onChanged;

  @override
  State<DashboardReadersListView> createState() => _DashboardReadersListViewState();
}

class _DashboardReadersListViewState extends State<DashboardReadersListView> {
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    final controller = TextEditingController();
    controller.addListener(_notifyChanged);
    _controllers = [controller];
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _notifyChanged() {
    final readers = _controllers
        .map((c) => c.text.trim())
        .where((text) => text.isNotEmpty)
        .toList();
    widget.onChanged?.call(readers);
  }

  void _addReader() {
    setState(() {
      final controller = TextEditingController();
      controller.addListener(_notifyChanged);
      _controllers.add(controller);
    });
  }

  void _removeReader(int index) {
    setState(() {
      _controllers[index].removeListener(_notifyChanged);
      _controllers[index].dispose();
      _controllers.removeAt(index);
    });
    _notifyChanged();
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
