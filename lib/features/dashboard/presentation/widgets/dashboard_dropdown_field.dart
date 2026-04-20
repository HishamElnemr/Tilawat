import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';
import 'package:tilawat/core/utils/quran_surahs.dart';

class DashboardDropdownField extends StatefulWidget {
  const DashboardDropdownField({super.key});

  @override
  State<DashboardDropdownField> createState() => _DashboardDropdownFieldState();
}

class _DashboardDropdownFieldState extends State<DashboardDropdownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final textStyle = AppStyles.body1Medium16(context).copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      color: colorScheme.onSurface,
    );

    final iconColor = colorScheme.onSurface.withValues(alpha: 0.72);
    final borderRadius = BorderRadius.circular(20);

    return DropdownMenu<String>(
      expandedInsets: EdgeInsets.zero,
      enableFilter: true,
      enableSearch: true,
      requestFocusOnTap: true,
      menuHeight: 250,
      hintText: 'اختر السورة',
      textStyle: textStyle,
      trailingIcon: Icon(Icons.keyboard_arrow_down_rounded, color: iconColor),
      selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_rounded, color: iconColor),
      inputDecorationTheme: _buildInputDecoration(colorScheme, textStyle, borderRadius),
      menuStyle: _buildMenuStyle(colorScheme),
      onSelected: (String? value) {
        setState(() {
          selectedValue = value;
        });
      },
      dropdownMenuEntries: _buildEntries(textStyle),
    );
  }

  InputDecorationTheme _buildInputDecoration(
    ColorScheme colorScheme,
    TextStyle textStyle,
    BorderRadius borderRadius,
  ) {
    final outlineBorder = BorderSide(color: colorScheme.outline);

    return InputDecorationTheme(
      filled: true,
      fillColor: Color.alphaBlend(
        colorScheme.outline.withValues(alpha: 0.22),
        colorScheme.surface,
      ),
      hintStyle: textStyle.copyWith(
        color: colorScheme.onSurface.withValues(alpha: 0.72),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: outlineBorder,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: outlineBorder,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
      ),
    );
  }

  MenuStyle _buildMenuStyle(ColorScheme colorScheme) {
    return MenuStyle(
      backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colorScheme.outline),
        ),
      ),
      elevation: const WidgetStatePropertyAll(4),
    );
  }

  List<DropdownMenuEntry<String>> _buildEntries(TextStyle textStyle) {
    return quranSurahs.map((surah) {
      return DropdownMenuEntry<String>(
        value: surah,
        label: surah,
        style: MenuItemButton.styleFrom(textStyle: textStyle),
      );
    }).toList();
  }
}
