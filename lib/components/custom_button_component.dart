import 'package:flutter/material.dart';

class CustomButtonComponent extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color? backgroundButton;
  final IconData? icon;
  final VoidCallback onTap;

  const CustomButtonComponent(
      {super.key,
      required this.label,
      required this.labelColor,
      this.backgroundButton,
      required this.onTap,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          style: ButtonStyle(
              backgroundColor: backgroundButton != null
                  ? WidgetStateProperty.all(backgroundButton)
                  : null),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Icon(icon) : const SizedBox(),
              Text(
                label,
                style:
                    TextStyle(color: labelColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
