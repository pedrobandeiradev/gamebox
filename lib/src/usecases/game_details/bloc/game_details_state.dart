abstract class GameDetailsState {}

class SucessfullyRetrievedGameDetailsState extends GameDetailsState {
  final dynamic response;

  SucessfullyRetrievedGameDetailsState(this.response);
}

class LoadingGameDetailsState extends GameDetailsState {}

class FailureRetrievingGameDetailsState extends GameDetailsState {}
