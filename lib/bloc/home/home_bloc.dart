import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PageController pageController = PageController();
  HomeBloc() : super(HomeInitial()) {
    on<ChangeCurrentPage>(_changeCurrenPage);
  }
  void _changeCurrenPage(ChangeCurrentPage event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentPage: event.currentPage));
  }
}
