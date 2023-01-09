import 'package:bloc/bloc.dart';
import 'package:gamebox/src/domain/entities/game_details.dart';
import 'package:gamebox/src/domain/usecases/game_details/repository/game_details_repository.dart';

import 'game_details_index.dart';

class GameDetailsBloc extends Bloc {
  final GameDetails repository;
  GameDetailsBloc({required this.repository}) : super(InitialState()) {
    on<GetGameDetailsEvent>(
      (event, emit) async {
        emit(LoadingGameDetailsState());
        try {
          final GameDetailsEntity? response =
              await repository.getGameDetails(id: event.id);
          emit(
            SucessfullyRetrievedGameDetailsState(
              content: response,
            ),
          );
        } catch (exception) {
          emit(FailureRetrievingGameDetailsState());
        }
      },
    );
  }
}
