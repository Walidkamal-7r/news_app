import 'package:flutter/material.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/ui/home/category_details/category_details.dart';
import 'package:news/ui/home/category_fragment/category_fragment.dart';
import 'package:news/ui/home/drawer/home_drawer.dart';
import 'package:news/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory == null ?
        AppLocalizations.of(context)!.home : selectedCategory!.title,
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge),
      ),
      body: selectedCategory == null ?
      CategoryFragment(onCategoryItemClick: onCategoryItemClick,) :
      CategoryDetails(category: selectedCategory!,),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerClick: onDrawerItemClick,),
      ),
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {

    });
  }

  void onDrawerItemClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
