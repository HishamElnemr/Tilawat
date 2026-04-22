import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'dashboard_upload_default_state.dart';
import 'dashboard_upload_loading_state.dart';
import 'dashboard_upload_success_state.dart';

class DashboardUploadBox extends StatefulWidget {
  const DashboardUploadBox({super.key, this.onChanged});

  final ValueChanged<PlatformFile?>? onChanged;

  @override
  State<DashboardUploadBox> createState() => _DashboardUploadBoxState();
}

class _DashboardUploadBoxState extends State<DashboardUploadBox> {
  FilePickerResult? result;
  bool isLoading = false;

  Future<void> _pickAudio() async {
    setState(() => isLoading = true);

    final picked = await FilePicker.pickFiles(type: FileType.audio);

    if (mounted) {
      setState(() {
        isLoading = false;
        if (picked != null) {
          result = picked;
          widget.onChanged?.call(picked.files.single);
        }
      });
    }
  }

  void _removeFile() {
    setState(() {
      result = null;
      widget.onChanged?.call(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: (isLoading || result != null) ? null : _pickAudio,
      child: Container(
        width: double.infinity,
        height: 143,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: Color.alphaBlend(
            colorScheme.outline.withValues(alpha: 0.22),
            colorScheme.surface,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorScheme.outline),
        ),
        child: _buildContent(colorScheme),
      ),
    );
  }

  Widget _buildContent(ColorScheme colorScheme) {
    if (isLoading) {
      return DashboardUploadLoadingState(colorScheme: colorScheme);
    }

    if (result != null) {
      return DashboardUploadSuccessState(
        fileName: result!.files.single.name,
        colorScheme: colorScheme,
        onPickAudio: _pickAudio,
        onRemoveFile: _removeFile,
      );
    }

    return DashboardUploadDefaultState(colorScheme: colorScheme);
  }
}
