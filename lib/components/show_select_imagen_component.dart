import 'package:flutter/material.dart';
import 'package:store_app/theme/color_app.dart';

class ShowSelectImage {
  static void imageModal(BuildContext context, int typeButon) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: AppColor.colorffffff,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColor.color004CFF,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Opciones",
                    textAlign: TextAlign.right,
                  ),
                ),
                const Divider(),
                CustomButton(
                  text: 'Cámara',
                  onTap: () {},
                  // onTap: () => addProvider.pickImage(1, typeButon),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Galeria',
                  onTap: () {},
                  // onTap: () => addProvider.pickImage(2, typeButon),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.color004CFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: AppColor.color202020,
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
