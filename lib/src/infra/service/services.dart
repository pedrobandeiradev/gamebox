import 'dart:convert';

import 'package:gamebox/src/infra/models/game_details_response.dart';
import 'package:gamebox/src/infra/models/games_list_response.dart';
import 'package:gamebox/src/infra/service/games_list/games_list_request.dart';

import 'game_details/game_details_request.dart';
import 'http_provider.dart';

abstract class GameBoxServices {
  Future<GamesListModel>? getListOfGames(
    int? page,
    String? category,
    String? platform,
  );
  Future<GameDetailsModel>? getGameDetails(
    int id,
  );
}

class Services with GameBoxProvider implements GameBoxServices {
  @override
  Future<GamesListModel>? getListOfGames(
    int? page,
    String? category,
    String? platform,
  ) async {
    final GamesListRequest request = GamesListRequest(
      page: page,
      category: category,
      platform: platform,
    );
    final data = await GameBoxProvider.execute<GamesListModel>(
      request: request,
    );
    return GamesListModel.fromJson(
      json.decode(
        data?.body ?? '',
      ),
    );
  }

  @override
  Future<GameDetailsModel>? getGameDetails(int id) async {
    final GameDetailsRequest request = GameDetailsRequest(
      id: id,
    );
    final data = await GameBoxProvider.execute<GameDetailsModel>(
      request: request,
    );
    return GameDetailsModel.fromJson(
      json.decode(
        data?.body ?? '',
      ),
    );
  }
}
