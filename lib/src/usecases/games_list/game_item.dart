class GameItemEntity {
  final int id;
  final String title;
  final String shortDescription;
  final String thumbnail;
  final String publisher;
  final String releaseDate;

  GameItemEntity({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.thumbnail,
    required this.publisher,
    required this.releaseDate,
  });
}
