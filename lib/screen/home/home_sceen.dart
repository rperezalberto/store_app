import 'package:flutter/material.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
