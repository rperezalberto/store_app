import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class NextButtonComponent extends StatelessWidget {
  final VoidCallback onTap;
  const NextButtonComponent({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(30, 30),
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
      child: Icon(Icons.arrow_forward_rounded,
          color: AppColor.colorffffff, size: 16, weight: 9),
    );
  }
}
