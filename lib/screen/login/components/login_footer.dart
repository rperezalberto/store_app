import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class LoginFooter extends StatelessWidget {
  final String label;
  final String labelLink;
  final VoidCallback onTap;
  const LoginFooter(
      {super.key,
      required this.label,
      required this.labelLink,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColor.color202020,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            labelLink,
            style: TextStyle(
              fontSize: 12,
              color: AppColor.color004CFF,
            ),
          ),
        ),
      ],
    );
  }
}
