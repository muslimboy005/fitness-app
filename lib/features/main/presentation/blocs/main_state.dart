class MainState {
  final bool acceptOne;
  final bool acceptTwo;

  MainState({
    required this.acceptOne,
    required this.acceptTwo,
  });

  MainState copyWith({
    bool? acceptOne,
    bool? acceptTwo,
  }) {
    return MainState(
      acceptOne: acceptOne ?? this.acceptOne,
      acceptTwo: acceptTwo ?? this.acceptTwo,
    );
  }
}
