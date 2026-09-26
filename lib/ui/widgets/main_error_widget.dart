import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/size_utils.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;

  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      spacing: height * 0.04,
      children: [
        Text(errorMessage, style: Theme.of(context).textTheme.labelLarge),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyColor),
          onPressed: onPressed,
          child: Text(
            'Try Again',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
