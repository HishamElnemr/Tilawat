import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

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
    return Row(
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
