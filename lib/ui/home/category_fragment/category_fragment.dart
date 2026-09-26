import 'package:flutter/material.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/ui/home/category_fragment/widget/category_item.dart';
import 'package:news/utils/size_utils.dart';

typedef OnCategoryItemClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  final OnCategoryItemClick onCategoryItemClick;

  CategoryFragment({super.key, required this.onCategoryItemClick});
  List<Category> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    categoriesList = Category.getCategoriesList(
      Theme.of(context).brightness == Brightness.dark,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          Text(
            '${AppLocalizations.of(context)!.good_morning}\n${AppLocalizations.of(context)!.here_is_some_news_for_you}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                    category: categoriesList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
