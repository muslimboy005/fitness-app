import 'package:flutter_86_vazifa/features/main/presentation/blocs/main_event.dart';
import 'package:flutter_86_vazifa/features/main/presentation/blocs/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState(acceptOne: false, acceptTwo: false)) {
    on<ChengedStateEvent>((event, emit) {
      if (event.statePosition == 1) {
        emit(state.copyWith(acceptOne: true));
      } else if (event.statePosition == 2) {
        emit(state.copyWith(acceptTwo: true));
      }
    });
  }
}
