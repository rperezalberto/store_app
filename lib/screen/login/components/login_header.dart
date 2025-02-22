import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class LoginHeader extends StatelessWidget {
  final String label;
  final String subLabel;
  const LoginHeader({super.key, required this.label, required this.subLabel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 134,
            height: 134,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: AppColor.color004CFF,
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
