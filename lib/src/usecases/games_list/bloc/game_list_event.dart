abstract class GameListEvent {}

class GetListOfGamesEvent extends GameListEvent {}

class SearchGameByTermEvent extends GameListEvent {
  final String term;

  SearchGameByTermEvent({required this.term});
}

class SortGameListEvent extends GameListEvent {
  final String term;

  SortGameListEvent({required this.term});
}
