import 'package:equatable/equatable.dart';

abstract class GameDetailsEvent extends Equatable {}

class GetGameDetailsEvent extends GameDetailsEvent {
  final int id;

  GetGameDetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
