class TilawahEntity {
  final String id;
  final String surahName;
  final List<String> reciters;
  final bool isRamadan;
  final String audioUrl;
  final String publicId;
  final String? description;
  final String? date;
  final DateTime createdAt;

  TilawahEntity({
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
}
