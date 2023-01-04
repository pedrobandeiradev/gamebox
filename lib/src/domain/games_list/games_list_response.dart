import 'package:gamebox/src/domain/game_details/game_details_response.dart';

class GamesListResponse {
  final List<GameDetailsResponse> games;

  GamesListResponse(
    this.games,
  );

  GamesListResponse.fromJson(Map<String, dynamic> json) : games = json['games'];
}
