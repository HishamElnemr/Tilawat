import 'package:flutter/material.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_toggle_button.dart';

class DashboardRamadanToggle extends StatefulWidget {
  const DashboardRamadanToggle({
    super.key,
    this.onChanged,
    this.initialValue = false,
  });

  final ValueChanged<bool>? onChanged;
  final bool initialValue;

  @override
  State<DashboardRamadanToggle> createState() => _DashboardRamadanToggleState();
}

class _DashboardRamadanToggleState extends State<DashboardRamadanToggle> {
  late bool _isRamadan;

  @override
  void initState() {
    super.initState();
    _isRamadan = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return _buildToggleRow();
  }

  Widget _buildToggleRow() {
    return Row(
      children: [
        Expanded(
          child: DashboardToggleButton(
            label: 'نعم',
            isSelected: _isRamadan,
            onTap: () {
              if (!_isRamadan) {
                setState(() => _isRamadan = true);
                widget.onChanged?.call(true);
              }
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DashboardToggleButton(
            label: 'لا',
            isSelected: !_isRamadan,
            onTap: () {
              if (_isRamadan) {
                setState(() => _isRamadan = false);
                widget.onChanged?.call(false);
              }
            },
          ),
        ),
      ],
    );
  }
}
