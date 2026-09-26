import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/utils/size_utils.dart';

class ConfigItem extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  const ConfigItem({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.whiteColor, width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppStyles.medium20White),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_drop_down_outlined,
                size: 25,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
