import 'package:gamebox/src/domain/entities/game_details.dart';
import 'package:gamebox/src/domain/repository/gamebox_repository.dart';

class GameDetails extends GameBoxRepository {
  Future<GameDetailsEntity>? getGameDetails({required int id}) {}
}
