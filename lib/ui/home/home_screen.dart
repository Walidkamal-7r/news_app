import 'package:flutter/material.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/ui/home/category_fragment/category_fragment.dart';
import 'package:news/ui/home/drawer/home_drawer.dart';
import 'package:news/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home, style: Theme
            .of(context)
            .textTheme
            .headlineLarge),
      ),
      body: CategoryFragment(),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(),
      ),
    );
  }
}
