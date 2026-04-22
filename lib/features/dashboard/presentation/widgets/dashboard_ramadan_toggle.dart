import 'package:flutter/material.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_ramadan_day_dropdown.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_ramadan_year_field.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_toggle_button.dart';

class DashboardRamadanToggle extends StatefulWidget {
  const DashboardRamadanToggle({
    super.key,
    this.onChanged,
    this.onDateSelected,
    this.initialValue = false,
  });

  final ValueChanged<bool>? onChanged;
  final void Function(String? day, String year)? onDateSelected;
  final bool initialValue;

  @override
  State<DashboardRamadanToggle> createState() => _DashboardRamadanToggleState();
}

class _DashboardRamadanToggleState extends State<DashboardRamadanToggle> {
  late bool _isRamadan;
  String? _selectedDay;
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isRamadan = widget.initialValue;
  }

  @override
  void dispose() {
    _dayController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _notifyDateChanged() {
    widget.onDateSelected?.call(_selectedDay, _yearController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildToggleRow(),
        _buildDateFields(),
      ],
    );
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

  Widget _buildDateFields() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: _isRamadan
          ? Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: DashboardRamadanDayDropdown(
                      controller: _dayController,
                      onSelected: (String? value) {
                        setState(() => _selectedDay = value);
                        _notifyDateChanged();
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: DashboardRamadanYearField(
                      controller: _yearController,
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
