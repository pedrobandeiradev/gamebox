abstract class GameListState {}

class SucessfullyRetrievedListOfGamesState extends GameListState {
  final dynamic response;

  SucessfullyRetrievedListOfGamesState(this.response);
}

class LoadingListOfGamesState extends GameListState {}

class FailureRetrievingListOfGamesState extends GameListState {}
