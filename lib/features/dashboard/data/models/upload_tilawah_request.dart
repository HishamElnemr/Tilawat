import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class UploadTilawahRequest {
  final File audio;
  final String surahName;
  final List<String> reciters;
  final bool isRamadan;
  final String? description;

  UploadTilawahRequest({
    required this.audio,
    required this.surahName,
    required List<String> reciters,
    required this.isRamadan,
    this.description,
  }) : reciters = List<String>.unmodifiable(reciters);

  /// Converts the request into a proper [FormData] object
  /// matching exactly what Postman sends as form-data.
  Future<FormData> toFormData() async {
    // ── Audio file ──
    final filePath = audio.path;
    final fileName = filePath.split(Platform.pathSeparator).last;

    // ── Reciters: send as JSON string like Postman does ──
    // Postman sends:  reciters = ["hisham"]  (a JSON-encoded string)
    final recitersJson = jsonEncode(
      reciters
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList(growable: false),
    );

    final multipartFile = await MultipartFile.fromFile(
      filePath,
      filename: fileName,
    );

    final formData = FormData.fromMap({
      'audio': multipartFile,
      'surahName': surahName,
      'reciters': recitersJson,
      'isRamadan': isRamadan.toString(),
    });

    if (description != null && description!.isNotEmpty) {
      formData.fields.add(MapEntry('description', description!));
    }

    return formData;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'audio': MultipartFile.fromFileSync(
        audio.path,
        filename: audio.path.split(Platform.pathSeparator).last,
      ),
      'surahName': surahName,
      'reciters': jsonEncode(
        reciters
            .map((item) => item.trim())
            .where((item) => item.isNotEmpty)
            .toList(growable: false),
      ),
      'isRamadan': isRamadan.toString(),
    };

    if (description != null && description!.isNotEmpty) {
      map['description'] = description;
    }

    return map;
  }
}
