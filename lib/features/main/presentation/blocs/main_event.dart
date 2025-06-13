abstract class MainEvent {}

class ChengedStateEvent extends MainEvent {
  final int statePosition;

  ChengedStateEvent({required this.statePosition});
}
