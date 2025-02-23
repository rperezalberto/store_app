import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/home/home_bloc.dart';
import 'package:store_app/bloc/add/add_article_bloc.dart';
import 'package:store_app/bloc/main_app/main_app_bloc.dart';
import 'package:store_app/screen/add/add_screen.dart';
import 'package:store_app/theme/app_theme.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MainAppBloc()),
          BlocProvider(create: (_) => HomeBloc()),
          BlocProvider(create: (_) => AddArcticleBloc()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme.themeApp,
      home: AddScreen(),
    );
  }
}
