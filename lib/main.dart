import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/main_app/main_app_bloc.dart';
import 'package:store_app/screen/login/login_sreen.dart';
import 'package:store_app/screen/main/main_app_home.dart';
import 'package:store_app/theme/app_theme.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MainAppBloc()),
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
      home: MainAppHome(),
    );
  }
}
