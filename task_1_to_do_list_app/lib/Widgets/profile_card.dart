import 'package:flutter/material.dart';
import 'package:task_1_to_do_list_app/Classes/colors.dart';
import 'package:task_1_to_do_list_app/Classes/dimensions.dart';
import 'package:task_1_to_do_list_app/Widgets/big_text.dart';

class ImageTextCard extends StatelessWidget {
  final String text;
  final ImageProvider image;

  ImageTextCard({
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: ColorRes.app,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.height20, vertical: Dimensions.height12),
        child: Row(
          children: <Widget>[
            Container(
              width: Dimensions.height40,
              height: Dimensions.height40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    Dimensions.height10), // Creates a circular clip
                child: Image(
                  image: image,
                  // height: Dimensions.height20,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: Dimensions.height45),
            BigText(text: text),
          ],
        ),
      ),
    );
  }
}
