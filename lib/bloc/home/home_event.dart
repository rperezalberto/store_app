part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrentPage extends HomeEvent {
  final int currentPage;

  const ChangeCurrentPage({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
