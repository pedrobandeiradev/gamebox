import 'package:gamebox/src/domain/entities/game_item.dart';
import 'package:gamebox/src/domain/repository/gamebox_repository.dart';

class GamesList extends GameBoxRepository {
  Future<List<GameItemEntity>>? getListOfGames() {}
}
