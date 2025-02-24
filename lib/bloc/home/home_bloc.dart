import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/shop_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<ShopModel> shopItem = [
    ShopModel(
        title: "Nike",
        description:
            "Lorem ipsum dolor sit amet consectetur consectetur consectetur consectetur",
        price: 800,
        discount: 150,
        image: "5.png"),
    ShopModel(
        title: "Adidas",
        description:
            "Lorem ipsum dolor sit amet consectetur consectetur consectetur consectetur",
        price: 800,
        discount: 100,
        image: "6.png"),
    ShopModel(
        title: "Puma",
        description:
            "Lorem ipsum dolor sit amet consectetur consectetur consectetur consectetur",
        price: 600,
        discount: 200,
        image: "7.png"),
    ShopModel(
        title: "Reebok",
        description:
            "Lorem ipsum dolor sit amet consectetur consectetur consectetur consectetur",
        price: 500,
        discount: 100,
        image: "8.png"),
  ];
  final List<ShopMoreView> showMore = [
    ShopMoreView(
      title: "Clothing",
      price: 109,
      images: [
        MoreView(image: "1.png"),
        MoreView(image: "2.png"),
        MoreView(image: "3.png"),
        MoreView(image: "4.png"),
      ],
    ),
    ShopMoreView(
      title: "Shoes",
      price: 200,
      images: [
        MoreView(image: "5.png"),
        MoreView(image: "6.png"),
        MoreView(image: "7.png"),
        MoreView(image: "8.png"),
      ],
    ),
  ];

  final PageController pageController = PageController();
  HomeBloc() : super(HomeInitial()) {
    on<ChangeCurrentPage>(_changeCurrenPage);
  }
  void _changeCurrenPage(ChangeCurrentPage event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentPage: event.currentPage));
  }
}
