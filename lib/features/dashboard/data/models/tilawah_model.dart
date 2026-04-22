import '../../domain/entities/tilawah_entity.dart';

class TilawahModel {
  final String id;
  final String surahName;
  final List<String> reciters;
  final bool isRamadan;
  final String audioUrl;
  final String publicId;
  final String? description;
  final String? date;
  final DateTime createdAt;

  TilawahModel({
    required this.id,
    required this.surahName,
    required this.reciters,
    required this.isRamadan,
    required this.audioUrl,
    required this.publicId,
    this.description,
    this.date,
    required this.createdAt,
  });

  factory TilawahModel.fromJson(Map<String, dynamic> json) {
    return TilawahModel(
      id: json['_id'] as String,
      surahName: json['surahName'] as String,
      reciters: List<String>.from(json['reciters'] ?? []),
      isRamadan: json['isRamadan'] as bool? ?? false,
      audioUrl: json['audioUrl'] as String,
      publicId: json['publicId'] as String,
      description: json['description'] as String?,
      date: json['date'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'surahName': surahName,
      'reciters': reciters,
      'isRamadan': isRamadan,
      'audioUrl': audioUrl,
      'publicId': publicId,
      'description': description,
      'date': date,
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
      date: date,
      createdAt: createdAt,
    );
  }
}
