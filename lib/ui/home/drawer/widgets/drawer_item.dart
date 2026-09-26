import 'package:flutter/material.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/utils/size_utils.dart';

class DrawerItem extends StatelessWidget {
  final String iconName;
  final String text;

  const DrawerItem({super.key, required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Row(
        spacing: width * 0.04,
        children: [
          Image.asset(iconName),
          Text(text, style: AppStyles.bold16White),
        ],
      ),
    );
  }
}
