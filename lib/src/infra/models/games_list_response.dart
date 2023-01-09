import 'game_details_response.dart';

class GamesListModel {
  final List<GameDetailsModel> games;

  GamesListModel(
    this.games,
  );

  GamesListModel.fromJson(Map<String, dynamic> json) : games = json['games'];
}
