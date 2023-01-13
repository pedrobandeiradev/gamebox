import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamebox/src/domain/entities/game_item.dart';
import 'package:gamebox/src/domain/usecases/games_list/repository/games_list_repository.dart';

import 'game_list_index.dart';

class GameListBloc extends Bloc {
  //MARK - Remove
  late List<GameItemEntity> games = [
    _game,
    _game,
    _game2,
  ];

  final GameItemEntity _game = GameItemEntity(
    id: 452,
    title: 'Call Of Duty: Warzone',
    shortDescription:
        'A standalone free-to-play battle royale and modes accessible via Call of Duty: Modern Warfare.',
    thumbnail: 'https://www.freetogame.com/g/452/thumbnail.jpg',
    publisher: 'Activision Blizzard',
    releaseDate: '25/10/1991',
  );

  final GameItemEntity _game2 = GameItemEntity(
    id: 452,
    title: 'AAA Of Duty: 2',
    shortDescription:
        'A standalone free-to-play battle royale and modes accessible via Call of Duty: Modern Warfare.',
    thumbnail: 'https://www.freetogame.com/g/452/thumbnail.jpg',
    publisher: 'Activision Blizzard',
    releaseDate: '25/10/1996',
  );

  final GamesList repository;
  GameListBloc({required this.repository}) : super(InitialState()) {
    on<GetListOfGamesEvent>(
      (event, emit) async {
        emit(LoadingListOfGamesState());
        try {
          final List<GameItemEntity>? response =
              await repository.getListOfGames();
          emit(
            SucessfullyRetrievedListOfGamesState(
              content: response,
            ),
          );
        } catch (exception) {
          emit(FailureRetrievingListOfGamesState());
        }
      },
    );
  }
}
