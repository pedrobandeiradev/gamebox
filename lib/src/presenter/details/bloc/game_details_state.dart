import 'package:equatable/equatable.dart';

abstract class GameDetailsState extends Equatable {}

class InitialState extends GameDetailsState {
  @override
  List<Object?> get props => <Object>[];
}

class SucessfullyRetrievedGameDetailsState<T> extends GameDetailsState {
  final T content;

  SucessfullyRetrievedGameDetailsState({required this.content});

  @override
  List<Object?> get props => <Object>[content as Object];
}

class LoadingGameDetailsState extends GameDetailsState {
  @override
  List<Object?> get props => [];
}

class FailureRetrievingGameDetailsState extends GameDetailsState {
  final String? message;

  FailureRetrievingGameDetailsState({
    this.message,
  });
  @override
  List<Object?> get props => [message];
}
