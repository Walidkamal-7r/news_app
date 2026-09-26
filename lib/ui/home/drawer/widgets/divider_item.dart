import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/size_utils.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Divider(
      color: AppColors.whiteColor,
      thickness: 2,
      indent: width * 0.06,
      endIndent: width * 0.06,
    );
  }
}
