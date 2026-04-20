import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tilawat/core/utils/app_images.dart';
import 'package:tilawat/core/utils/app_styles.dart';

class DashboardReadersRow extends StatelessWidget {
  const DashboardReadersRow({
    super.key,
    required this.controller,
    required this.onTap,
    required this.onDelete,
    required this.showDelete,
  });

  final TextEditingController controller;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.onSurface.withValues(alpha: 0.72);
    final fillColor = Color.alphaBlend(
      colorScheme.outline.withValues(alpha: 0.22),
      colorScheme.surface,
    );
    final borderRadius = BorderRadius.circular(16);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'يرجى إدخال اسم القارئ';
              }
              return null;
            },
            style: AppStyles.body2Regular14(
              context,
            ).copyWith(color: colorScheme.onSurface),
            decoration: InputDecoration(
              hintText: 'أدخل اسم القارئ',
              hintStyle: AppStyles.body2Regular14(
                context,
              ).copyWith(color: iconColor),
              filled: true,
              fillColor: fillColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),
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
              errorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: colorScheme.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: colorScheme.error, width: 1.5),
              ),
            ),
          ),
        ),
        if (showDelete) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onDelete,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: borderRadius,
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.assetsImagesTrash,
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ),
        ],
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: fillColor,
              borderRadius: borderRadius,
            ),
            child: Icon(Icons.add, color: iconColor, size: 20),
          ),
        ),
      ],
    );
  }
}

