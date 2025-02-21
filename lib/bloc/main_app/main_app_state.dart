part of 'main_app_bloc.dart';

// Clase base de estados
sealed class MainAppState extends Equatable {
  final int itemPage;
  const MainAppState(this.itemPage);

  MainAppState copyWith({int? itemPage});

  @override
  List<Object> get props => [itemPage];
}

// Estado inicial
final class MainAppInitial extends MainAppState {
  const MainAppInitial(super.itemPage);

  @override
  MainAppState copyWith({int? itemPage}) {
    return MainAppInitial(itemPage ?? this.itemPage);
  }
}
