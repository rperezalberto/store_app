part of 'main_app_bloc.dart';

// Clase base de eventos
sealed class MainAppEvent extends Equatable {
  const MainAppEvent();

  @override
  List<Object> get props => [];
}

final class ChangePageEvent extends MainAppEvent {
  final int newPage;

  const ChangePageEvent(this.newPage);

  @override
  List<Object> get props => [newPage];
}
