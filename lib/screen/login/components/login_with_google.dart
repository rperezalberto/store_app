import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColor.color161b1b),
        ),
        onPressed: () {
          log("Login with Google");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/google.png", width: 29, height: 29),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Login with Google",
                style: TextStyle(color: AppColor.colorffffff),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
