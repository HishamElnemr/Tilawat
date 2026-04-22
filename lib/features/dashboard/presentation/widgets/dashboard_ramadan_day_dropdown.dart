import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardRamadanDayDropdown extends StatelessWidget {
  const DashboardRamadanDayDropdown({
    super.key,
    required this.controller,
    required this.onSelected,
  });

  final TextEditingController controller;
  final ValueChanged<String?> onSelected;

  static final List<String> ramadanDays =
      List.generate(30, (index) => '${index + 1} رمضان');

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.onSurface.withValues(alpha: 0.72);
    final borderRadius = BorderRadius.circular(16);
    final fillColor = Color.alphaBlend(
      colorScheme.outline.withValues(alpha: 0.22),
      colorScheme.surface,
    );

    final textStyle = AppStyles.body1Medium16(context).copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      color: colorScheme.onSurface,
    );

    return DropdownMenu<String>(
      controller: controller,
      expandedInsets: EdgeInsets.zero,
      enableFilter: true,
      enableSearch: true,
      requestFocusOnTap: true,
      menuHeight: 250,
      hintText: 'يوم رمضان',
      textStyle: textStyle,
      trailingIcon:
          Icon(Icons.keyboard_arrow_down_rounded, color: iconColor),
      selectedTrailingIcon:
          Icon(Icons.keyboard_arrow_up_rounded, color: iconColor),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
        hintStyle: textStyle.copyWith(color: iconColor),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colorScheme.outline),
          ),
        ),
        elevation: const WidgetStatePropertyAll(4),
      ),
      onSelected: onSelected,
      dropdownMenuEntries: ramadanDays.map((day) {
        return DropdownMenuEntry<String>(
          value: day,
          label: day,
          style: MenuItemButton.styleFrom(textStyle: textStyle),
        );
      }).toList(),
    );
  }
}
