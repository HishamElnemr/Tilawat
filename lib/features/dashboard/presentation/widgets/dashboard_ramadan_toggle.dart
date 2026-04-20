import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardRamadanToggle extends StatefulWidget {
  const DashboardRamadanToggle({
    super.key,
    this.onChanged,
    this.onDateChanged,
    this.initialValue = false,
  });

  final ValueChanged<bool>? onChanged;
  final ValueChanged<HijriDateTime>? onDateChanged;
  final bool initialValue;

  @override
  State<DashboardRamadanToggle> createState() => _DashboardRamadanToggleState();
}

class _DashboardRamadanToggleState extends State<DashboardRamadanToggle> {
  late bool _isRamadan;
  final HijriDatePickerController _dateController = HijriDatePickerController();

  @override
  void initState() {
    super.initState();
    _isRamadan = widget.initialValue;
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _ToggleButton(
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
              child: _ToggleButton(
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
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isRamadan
              ? Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.alphaBlend(
                        colorScheme.outline.withValues(alpha: 0.22),
                        colorScheme.surface,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.outline),
                    ),
                    child: SfHijriDateRangePicker(
                      controller: _dateController,
                      view: HijriDatePickerView.month,
                      selectionMode: DateRangePickerSelectionMode.single,
                      headerStyle: DateRangePickerHeaderStyle(
                        textAlign: TextAlign.center,
                        textStyle: AppStyles.body1Medium16(context).copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      monthCellStyle: HijriDatePickerMonthCellStyle(
                        textStyle: AppStyles.body2Regular14(context).copyWith(
                          color: colorScheme.onSurface,
                        ),
                        todayTextStyle:
                            AppStyles.body2Regular14(context).copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        disabledDatesTextStyle:
                            AppStyles.body2Regular14(context).copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.3),
                        ),
                      ),
                      selectionColor: colorScheme.primary,
                      selectionTextStyle:
                          AppStyles.body2Regular14(context).copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      todayHighlightColor: colorScheme.primary,
                      backgroundColor: Colors.transparent,
                      onSelectionChanged:
                          (DateRangePickerSelectionChangedArgs args) {
                        if (args.value is HijriDateTime) {
                          widget.onDateChanged?.call(args.value);
                        }
                      },
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 43,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Color.alphaBlend(
                    Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.22),
                    Theme.of(context).colorScheme.surface,
                  ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline,
            ),
          ),
          child: Text(
            label,
            style: AppStyles.button2SemiBold14(context).copyWith(
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

