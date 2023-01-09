class GameDetailsEntity {
  final String title;
  final String mainImageUrl;
  final Map<String, dynamic> mainInfo;
  final String about;
  final List<String> screenshots;

  GameDetailsEntity(this.mainInfo, this.title, this.mainImageUrl, this.about,
      this.screenshots);

  // information: {
  //               'Genre': 'Shooter',
  //               'Released on': '25/10/1991',
  //               'Publisher': 'Activision Blizzard',
  //               'Developed by': 'Infinity Ward',
  //             },
}
