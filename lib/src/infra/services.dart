import 'dart:convert';

import 'package:gamebox/src/domain/game_details/game_details_request.dart';
import 'package:gamebox/src/domain/game_details/game_details_response.dart';
import 'package:gamebox/src/domain/games_list/games_list_request.dart';
import 'package:gamebox/src/domain/games_list/games_list_response.dart';

import 'http_provider.dart';

abstract class GameBoxServices {
  Future<GamesListResponse>? getListOfGames(
    int? page,
    String? category,
    String? platform,
  );
  Future<GameDetailsResponse>? getGameDetails(
    int id,
  );
}

class Services with GameBoxProvider implements GameBoxServices {
  @override
  Future<GamesListResponse>? getListOfGames(
    int? page,
    String? category,
    String? platform,
  ) async {
    final GamesListRequest request = GamesListRequest(
      page: page,
      category: category,
      platform: platform,
    );
    final data = await GameBoxProvider.execute<GamesListResponse>(
      request: request,
    );
    return GamesListResponse.fromJson(
      json.decode(
        data?.body ?? '',
      ),
    );
  }

  @override
  Future<GameDetailsResponse>? getGameDetails(int id) async {
    final GameDetailsRequest request = GameDetailsRequest(
      id: id,
    );
    final data = await GameBoxProvider.execute<GameDetailsResponse>(
      request: request,
    );
    return GameDetailsResponse.fromJson(
      json.decode(
        data?.body ?? '',
      ),
    );
  }
}
