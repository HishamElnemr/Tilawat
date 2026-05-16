import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tilawat/core/utils/app_styles.dart';
import 'package:tilawat/features/auth/domain/entities/login_response_entity.dart';
import 'package:tilawat/features/dashboard/data/models/upload_tilawah_request.dart';
import 'package:tilawat/features/dashboard/presentation/cubits/upload_data_cubit.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_description_field.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_dropdown_field.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_ramadan_toggle.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_readers_list_view.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_section_label.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_submit_button.dart';
import 'package:tilawat/features/dashboard/presentation/widgets/dashboard_upload_box.dart';

class DashboardFormCard extends StatefulWidget {
  const DashboardFormCard({super.key, required this.token});

  final LoginResponseEntity token;

  @override
  State<DashboardFormCard> createState() => _DashboardFormCardState();
}

class _DashboardFormCardState extends State<DashboardFormCard> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();

  // Form data holders
  String? _selectedSurah;
  List<String> _reciters = [];
  bool _isRamadan = false;
  PlatformFile? _audioFile;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedSurah == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى اختيار اسم السورة')));
      return;
    }

    if (_audioFile == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى رفع ملف صوتي')));
      return;
    }

    final String surahName = _selectedSurah!;
    final List<String> reciters = List<String>.from(_reciters);
    final bool isRamadan = _isRamadan;
    final String descriptionText = _descriptionController.text.trim();
    final String? description = descriptionText.isNotEmpty
        ? descriptionText
        : null;

    final String audioPath = _audioFile!.path!;
    final File audio = File(audioPath);

    final UploadTilawahRequest request = UploadTilawahRequest(
      audio: audio,
      surahName: surahName,
      reciters: reciters,
      isRamadan: isRamadan,
      description: description,
    );

    context.read<UploadDataCubit>().uploadData(
      uploadDataRequest: request,
      token: widget.token,
    );
  }

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
      child: Form(
        key: _formKey,
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
            DashboardDropdownField(
              onChanged: (value) => _selectedSurah = value,
            ),
            const SizedBox(height: 16),
            const DashboardSectionLabel(text: 'القراء'),
            const SizedBox(height: 8),
            DashboardReadersListView(
              onChanged: (readers) => _reciters = readers,
            ),
            const SizedBox(height: 16),
            const DashboardSectionLabel(text: 'هل هي من ليالي رمضان؟'),
            const SizedBox(height: 8),
            DashboardRamadanToggle(onChanged: (value) => _isRamadan = value),
            const SizedBox(height: 16),
            const DashboardSectionLabel(text: 'رفع التلاوة'),
            const SizedBox(height: 8),
            DashboardUploadBox(onChanged: (file) => _audioFile = file),
            const SizedBox(height: 16),
            const DashboardSectionLabel(text: 'الوصف'),
            const SizedBox(height: 8),
            DashboardDescriptionField(controller: _descriptionController),
            const SizedBox(height: 16),
            DashboardSubmitButton(onPressed: _submitForm),
          ],
        ),
      ),
    );
  }
}
