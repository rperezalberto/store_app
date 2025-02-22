part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final int currentPage;
  const HomeState(this.currentPage);

  HomeState copyWith({int? currentPage});

  @override
  List<Object> get props => [currentPage];
}

final class HomeInitial extends HomeState {
  const HomeInitial([super.currentPage = 0]);

  @override
  HomeState copyWith({int? currentPage}) {
    return HomeInitial(currentPage ?? this.currentPage);
  }
}
