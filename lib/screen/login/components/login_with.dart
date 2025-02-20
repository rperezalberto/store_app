import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class LoginWith extends StatelessWidget {
  const LoginWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Or login with",
                  style: TextStyle(color: AppColor.colorffffff),
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
        ),
      ],
    );
  }
}
