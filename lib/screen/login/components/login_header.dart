import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class LoginHeader extends StatelessWidget {
  final String label;
  final String subLabel;
  const LoginHeader({super.key, required this.label, required this.subLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            "assets/images/logo.png",
            width: 150,
            height: 240,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: AppColor.colorffffff,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subLabel,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.color202020,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
