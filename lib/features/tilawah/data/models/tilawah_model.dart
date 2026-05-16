import 'package:tilawat/features/tilawah/domain/entities/tilawah_entity.dart';

class TilawahModel {
  final String id;
  final String surahName;
  final List<String> reciters;
  final bool isRamadan;
  final String audioUrl;
  final String publicId;
  final String? description;
  final DateTime createdAt;

  TilawahModel({
    required this.id,
    required this.surahName,
    required List<String> reciters,
    required this.isRamadan,
    required this.audioUrl,
    required this.publicId,
    this.description,
    required this.createdAt,
  }) : reciters = List<String>.unmodifiable(reciters);

  factory TilawahModel.fromJson(Map<String, dynamic> json) {
    return TilawahModel(
      id: json['_id'] as String,
      surahName: json['surahName'] as String,
      reciters: _parseReciters(json['reciters']),
      isRamadan: json['isRamadan'] as bool? ?? false,
      audioUrl: json['audioUrl'] as String,
      publicId: json['publicId'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'surahName': surahName,
      'reciters': List<String>.from(reciters),
      'isRamadan': isRamadan,
      'audioUrl': audioUrl,
      'publicId': publicId,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  TilawahEntity toEntity() {
    return TilawahEntity(
      id: id,
      surahName: surahName,
      reciters: reciters,
      isRamadan: isRamadan,
      audioUrl: audioUrl,
      publicId: publicId,
      description: description,
      createdAt: createdAt,
    );
  }

  static List<String> _parseReciters(dynamic rawReciters) {
    if (rawReciters is List) {
      return rawReciters
          .map((item) => item.toString().trim())
          .where((item) => item.isNotEmpty)
          .toList(growable: false);
    }

    if (rawReciters is String) {
      final value = rawReciters.trim();
      if (value.isEmpty) {
        return const <String>[];
      }
      return value
          .split(',')
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList(growable: false);
    }

    return const <String>[];
  }
}
