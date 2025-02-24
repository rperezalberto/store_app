import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/home/home_bloc.dart';
import 'package:store_app/components/next_button_component.dart';
import 'package:store_app/models/shop_model.dart';
import 'package:store_app/theme/color_app.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SearchHome(),
                Carousel(),
                CategoriesHome(),
                SizedBox(
                  height: 200,
                  child: TopItem(showMore: homeBloc.showMore),
                ),
                const SizedBox(height: 10),
                CustomItem(shop: homeBloc.shopItem),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: homeBloc.pageController,
                    onPageChanged: (index) {
                      homeBloc.add(ChangeCurrentPage(currentPage: index));
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ItemCarousel(
                          title: 'Big Sale',
                          subTitle: 'Happening \n Now',
                          image: '9.png',
                          background: AppColor.color00bce9,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ItemCarousel(
                          title: 'Big Sale',
                          subTitle: 'Happening \n Now',
                          image: '10.png',
                          background: AppColor.colord5bc7c,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ItemCarousel(
                          title: 'Big Sale',
                          subTitle: 'Happening \n Now',
                          image: '6.png',
                          background: AppColor.color00bce9,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: state.currentPage.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: AppColor.color004CFF,
                      color: AppColor.colorC7C7C7,
                      // size: const Size.square(11.0),
                      activeSize: const Size(40.0, 11.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ItemCarousel extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final Color background;
  const ItemCarousel(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.background});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: background, borderRadius: BorderRadius.circular(10)),
          child: Image.asset("assets/images/$image"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColor.colorffffff,
                ),
              ),
              Text(
                subTitle,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: AppColor.colorffffff,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchHome extends StatelessWidget {
  const SearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          "Shop",
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 36,
            child: TextField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: "Search",
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/icons/close.png",
                      width: 16, height: 16, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Categories", style: theme.textTheme.bodyMedium),
        Row(
          children: [
            Text(
              "See All",
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 18,
              ),
            ),
            NextButtonComponent(
              onTap: () {
                log("Seel All");
              },
            ),
          ],
        ),
      ],
    );
  }
}

class TopItem extends StatelessWidget {
  final List<ShopMoreView> showMore;

  const TopItem({super.key, required this.showMore});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final appWidth = size.width;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: showMore.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: (appWidth / 2),
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(4, 4),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true, // 🔥 También aquí
                      physics:
                          NeverScrollableScrollPhysics(), // 🔥 Evita el doble scroll
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, idx) {
                        return Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                                "assets/images/${showMore[index].images[idx].image}",
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(showMore[index].title,
                          style: theme.textTheme.bodyMedium),
                      Container(
                        width: 38,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "\$${showMore[index].price}",
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomItem extends StatelessWidget {
  final List<ShopModel> shop;
  const CustomItem({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: shop.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 160,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(4, 4),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/${shop[index].image}",
                          width: 160,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          shop[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.color202020,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${shop[index].price}",
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColor.color202020,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColor.color004CFF,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset("assets/icons/heart.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
