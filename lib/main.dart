import 'package:flutter/material.dart';
import 'package:store_app/screen/login/login_sreen.dart';
import 'package:store_app/screen/login/singup_screen.dart';
import 'package:store_app/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme.themeApp,
      home: SingupScreen(),
    );
  }
}
