class GameDetailsModel {
  final int id;
  final String title;
  final String? thumbnail;
  final String? status;
  final String shortDescription;
  final GameGenre genre;
  final String platform;
  final String publisher;
  final String? developer;
  final String releaseDate;
  final List<ScreenshotResponse>? screenshots;

  GameDetailsModel({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.releaseDate,
    this.thumbnail,
    this.status,
    this.developer,
    this.screenshots,
  });

  GameDetailsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumbnail = json['thumbnail'],
        status = json['status'],
        shortDescription = json['short_description'],
        genre = json['genre'],
        platform = json['platform'],
        publisher = json['publisher'],
        developer = json['developer'],
        releaseDate = json['release_date'],
        screenshots = json['screenshots'];
}

class ScreenshotResponse {
  final int id;
  final String image;

  ScreenshotResponse({
    required this.id,
    required this.image,
  });

  ScreenshotResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'];
}

enum GameGenre {
  mmorpg,
  shooter,
  moba,
  anime,
  battleRoyale, //battle-royale
  strategy,
  fantasy,
  sciFi, //sci-fi
  cardGames, //card
  racing,
  fighting,
  social,
  sports,
}
