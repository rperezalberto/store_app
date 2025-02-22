import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/home/home_bloc.dart';
import 'package:store_app/components/next_button_component.dart';
import 'package:store_app/theme/color_app.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchHome(),
                Carousel(),
                CategoriesHome(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TopItem(images: "1.png", title: "Clothing")),
                    Expanded(child: TopItem(images: "2.png", title: "Shoes")),
                  ],
                ),
                const SizedBox(height: 10),
                CustomItem(),
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
  final String images;
  final String title;
  const TopItem({super.key, required this.images, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final appWidth = size.width;

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
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        child: Image.asset("assets/images/$images"),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: theme.textTheme.bodyMedium),
                  Container(
                    width: 38,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppColor.colorDFE9FF,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "109",
                        style:
                            theme.textTheme.bodyMedium!.copyWith(fontSize: 12),
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
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dos celdas por fila
          crossAxisSpacing: 10, // Espaciado entre celdas
          mainAxisSpacing: 10, // Espaciado vertical
          childAspectRatio:
              0.75, // Relación de aspecto, para obtener un tamaño más controlado
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // Fijar un tamaño fijo para el contenedor
            width: 160, // Ancho fijo para la celda
            height: 250, // Altura fija para la celda
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
                          "assets/images/5.png",
                          width: 160, // Ancho de la imagen
                          height: 150, // Altura fija de la imagen
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur consectetur consectetur consectetur",
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
                          "17,00",
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
