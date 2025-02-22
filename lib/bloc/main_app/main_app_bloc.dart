import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/screen/home/home_sceen.dart';
import 'package:store_app/screen/wish/wisth_screen.dart';
import 'package:store_app/screen/search/search_screen.dart';
import 'package:store_app/screen/user/user_screen.dart';

part 'main_app_event.dart';
part 'main_app_state.dart';

class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  final item = [
    const HomeSceen(),
    const SearchScreen(),
    const WishScreen(),
    const UserScreen(),
  ];

  MainAppBloc() : super(const MainAppInitial(0)) {
    on<ChangePageEvent>(_onChangePage);
  }

  void _onChangePage(ChangePageEvent event, Emitter<MainAppState> emit) {
    emit(state.copyWith(itemPage: event.newPage));
  }
}
