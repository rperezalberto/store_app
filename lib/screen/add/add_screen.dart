import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:store_app/components/custom_button_component.dart';
import 'package:store_app/components/show_select_imagen_component.dart';
import 'package:store_app/theme/color_app.dart';
import 'package:store_app/utils/utils.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle titleInput = theme.textTheme.bodyMedium!.copyWith(
      fontSize: 18,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorffffff,
        title: Text("Add article", style: theme.textTheme.bodyLarge),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title arcticle", style: titleInput),
                    TextField(
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColor.color202020,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "Title",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price arcticle", style: titleInput),
                          TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.color202020,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: "Price",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Discount acrticle", style: titleInput),
                          TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.color202020,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: "Discount",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Image arcticle", style: titleInput),
                    GestureDetector(
                      onTap: () => ShowSelectImage.imageModal(
                          context, Utils.typeButon[ButtonType.portal]!),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: DottedBorder(
                          dashPattern: const [12, 8],
                          color: AppColor.color004CFF,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          child: ClipRRect(
                            child: SizedBox(
                              height: 150,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 50,
                                      color: AppColor.color004CFF,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Portada Photo",
                                      style: TextStyle(
                                        color: AppColor.color202020,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "(up to 12 Mb)",
                                      style: TextStyle(
                                        color: AppColor.colorC7C7C7,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description arcticle", style: titleInput),
                    TextField(
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColor.color202020,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "Description acticle",
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomButtonComponent(
                label: "Send",
                labelColor: AppColor.colorffffff,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
