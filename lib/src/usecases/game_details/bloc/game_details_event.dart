abstract class GameDetailsEvent {}

class GetGameDetailsEvent extends GameDetailsEvent {
  final int id;

  GetGameDetailsEvent({required this.id});
}
