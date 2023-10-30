import 'package:flutter/material.dart';

import '../Classes/colors.dart';
import '../Classes/dimensions.dart';
import 'big_text.dart';

class TaskCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onPressed;
  final Color color;

  TaskCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Dimensions.height45 * 4,
            width: Dimensions.height45 * 4,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(Dimensions.height15)),
            child: Image.asset(
              imagePath,
              height: Dimensions.height40 * 2.9,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: title,
                color: ColorRes.app,
                size: Dimensions.text20 * 1.2,
              ),
              Text(
                description,
                // Add text description style here
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
