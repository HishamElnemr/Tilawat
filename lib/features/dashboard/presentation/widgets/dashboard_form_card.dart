import 'package:flutter/material.dart';
import 'package:tilawat/core/utils/app_styles.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_description_field.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_dropdown_field.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_ramadan_toggle.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_readers_field.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_section_label.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_submit_button.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_upload_box.dart';

class DashboardFormCard extends StatelessWidget {
  const DashboardFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'إضافة تلاوة جديدة',
            style: AppStyles.heading3Bold18(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 17),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          const DashboardSectionLabel(text: 'اسم السورة'),
          const SizedBox(height: 8),
          const DashboardDropdownField(),
          const SizedBox(height: 16),
          const DashboardSectionLabel(text: 'القراء'),
          const SizedBox(height: 8),
          const DashboardReadersField(),
          const SizedBox(height: 16),
          const DashboardSectionLabel(text: 'هل هي من ليالي رمضان؟'),
          const SizedBox(height: 8),
          const DashboardRamadanToggle(),
          const SizedBox(height: 16),
          const DashboardSectionLabel(text: 'رفع التلاوة'),
          const SizedBox(height: 8),
          const DashboardUploadBox(),
          const SizedBox(height: 16),
          const DashboardSectionLabel(text: 'الوصف'),
          const SizedBox(height: 8),
          const DashboardDescriptionField(),
          const SizedBox(height: 16),
          const DashboardSubmitButton(),
        ],
      ),
    );
  }
}
