import 'package:flutter/material.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/category_localization.dart';
import 'package:news/utils/size_utils.dart';
class CategoryItem extends StatelessWidget {
  final Category category;

  final int index;

  const CategoryItem({super.key, required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var isEven = (index % 2 == 0);
    return Stack(
      alignment: isEven ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(category.imagePath),
        ),
        Column(
          spacing: height * 0.03,
          children: [
            Text(getCategoryTitle(context, category), style: Theme
                .of(context)
                .textTheme
                .bodyLarge),
            Container(
              padding: EdgeInsets.only(
                left: isEven ? width * 0.04 : 0,
                right: !isEven ? width * 0.04 : 0,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: AppColors.greyColor,
              ),
              child: Row(
                textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
                spacing: width * 0.04,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context)!.viewAll,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30,
                    child: Icon(
                      isEven
                          ? Icons.arrow_forward_ios_outlined
                          : Icons.arrow_back_ios_outlined,
                      size: 25,
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
