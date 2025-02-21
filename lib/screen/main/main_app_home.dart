import 'package:flutter/material.dart';
import 'package:store_app/bloc/main_app/main_app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/screen/home/home_sceen.dart';
import 'package:store_app/theme/color_app.dart';

class MainAppHome extends StatelessWidget {
  const MainAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    final mainAppBloc = BlocProvider.of<MainAppBloc>(context);
    const double size = 30.0;

    return BlocBuilder<MainAppBloc, MainAppState>(
      builder: (context, state) {
        return Scaffold(
          body: mainAppBloc.item[state.itemPage],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeSceen()));
            },
            disabledElevation: 0,
            backgroundColor: AppColor.color648286,
            elevation: 6.0,
            shape: const CircleBorder(),
            child: Icon(
              Icons.add,
              color: AppColor.colorffffff,
            ), // Asegura que el botón sea completamente redondo
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 12,
            shape: const CircularNotchedRectangle(), // Hace el recorte circular
            notchMargin: 8.0, // Margen entre el FAB y el BottomAppBar
            color: AppColor.color648286,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: ImageIcon(
                      const AssetImage("assets/icons/home.png"),
                      size: size,
                      color: state.itemPage == 0
                          ? AppColor.colorffffff
                          : AppColor.color0f1414,
                    ),
                    onPressed: () =>
                        // mainAppProvider.bottomNavigationBarChangeItem(0),
                        mainAppBloc.add(ChangePageEvent(0))),
                IconButton(
                    icon: ImageIcon(
                      const AssetImage("assets/icons/shop.png"),
                      size: size,
                      color: state.itemPage == 1
                          ? AppColor.colorffffff
                          : AppColor.color0f1414,
                    ),
                    onPressed: () =>
                        // mainAppProvider.bottomNavigationBarChangeItem(1),
                        mainAppBloc.add(ChangePageEvent(1))),
                const SizedBox(width: 48), // Espacio para el FAB
                IconButton(
                    icon: ImageIcon(
                      const AssetImage("assets/icons/heart.png"),
                      size: size,
                      color: state.itemPage == 2
                          ? AppColor.colorffffff
                          : AppColor.color0f1414,
                    ),
                    onPressed: () =>
                        // mainAppProvider.bottomNavigationBarChangeItem(2),
                        mainAppBloc.add(ChangePageEvent(2))),
                IconButton(
                    icon: ImageIcon(
                      const AssetImage("assets/icons/user.png"),
                      size: size,
                      color: state.itemPage == 3
                          ? AppColor.colorffffff
                          : AppColor.color0f1414,
                    ),
                    onPressed: () =>
                        // mainAppProvider.bottomNavigationBarChangeItem(3),
                        mainAppBloc.add(ChangePageEvent(3))),
              ],
            ),
          ),
        );
      },
    );
  }
}
