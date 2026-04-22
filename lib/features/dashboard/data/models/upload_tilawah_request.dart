import 'dart:io';

class UploadTilawahRequest {
  final File audio;
  final String surahName;
  final String reciters;
  final String isRamadan;
  final String? description;
  final String? date;

  UploadTilawahRequest({
    required this.audio,
    required this.surahName,
    required this.reciters,
    required this.isRamadan,
    this.description,
    this.date,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'surahName': surahName,
      'reciters': reciters,
      'isRamadan': isRamadan,
    };


    if (description != null && description!.isNotEmpty) {
      map['description'] = description;
    }

    if (isRamadan == 'true' ||
        isRamadan == '1' ||
        isRamadan.toLowerCase() == 'yes' ||
        isRamadan == 'نعم') {
      if (date != null) {
        map['date'] = date;
      }
    }

    return map;
  }
}
