class TilawahEntity {
  final String id;
  final String surahName;
  final List<String> reciters;
  final bool isRamadan;
  final String audioUrl;
  final String publicId;
  final String? description;
  final DateTime createdAt;

  TilawahEntity({
    required this.id,
    required this.surahName,
    required List<String> reciters,
    required this.isRamadan,
    required this.audioUrl,
    required this.publicId,
    this.description,
    required this.createdAt,
  }) : reciters = List<String>.unmodifiable(reciters);
}
