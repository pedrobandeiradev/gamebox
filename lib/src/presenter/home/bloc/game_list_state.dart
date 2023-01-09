import 'package:equatable/equatable.dart';

abstract class GameListState extends Equatable {}

class InitialState extends GameListState {
  @override
  List<Object?> get props => <Object>[];
}

class SucessfullyRetrievedListOfGamesState<T> extends GameListState {
  final T content;

  SucessfullyRetrievedListOfGamesState({required this.content});

  @override
  List<Object?> get props => <Object>[content as Object];
}

class LoadingListOfGamesState extends GameListState {
  @override
  List<Object?> get props => [];
}

class FailureRetrievingListOfGamesState extends GameListState {
  final String? message;

  FailureRetrievingListOfGamesState({
    this.message,
  });
  @override
  List<Object?> get props => [message];
}
