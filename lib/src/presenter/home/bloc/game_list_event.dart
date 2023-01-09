import 'package:equatable/equatable.dart';

abstract class GameListEvent extends Equatable {}

class GetListOfGamesEvent extends GameListEvent {
  @override
  List<Object?> get props => [];
}

class SearchGameByTermEvent extends GameListEvent {
  final String term;

  SearchGameByTermEvent({required this.term});

  @override
  List<Object?> get props => [term];
}

class SortGameListEvent extends GameListEvent {
  final String term;

  SortGameListEvent({required this.term});

  @override
  List<Object?> get props => [term];
}
