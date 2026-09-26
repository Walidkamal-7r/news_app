import 'package:flutter/material.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/ui/home/drawer/widgets/config_item.dart';
import 'package:news/ui/home/drawer/widgets/divider_item.dart';
import 'package:news/ui/home/drawer/widgets/drawer_item.dart';
import 'package:news/ui/home/drawer/widgets/language_bottom_sheet.dart';
import 'package:news/ui/home/drawer/widgets/theme_bottom_sheet.dart';
import 'package:news/utils/app_assets.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/utils/size_utils.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onDrawerClick;

  const HomeDrawer({super.key, required this.onDrawerClick});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Column(
      spacing: height * 0.02,
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.20,
          color: AppColors.whiteColor,
          child: Text(
            AppLocalizations.of(context)!.news_app,
            style: AppStyles.bold16Black,
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerClick();
          },
          child: DrawerItem(
            iconName: AppAssets.homeIcon,
            text: AppLocalizations.of(context)!.go_to_home,
          ),
        ),
        DividerItem(),
        DrawerItem(
          iconName: AppAssets.themeIcon,
          text: AppLocalizations.of(context)!.theme,
        ),
        ConfigItem(
          text: themeProvider.isDarkMode(context)
              ? AppLocalizations.of(context)!.dark
              : AppLocalizations.of(context)!.light,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const ThemeBottomSheet(),
            );
          },
        ),
        DividerItem(),
        DrawerItem(
          iconName: AppAssets.languageIcon,
          text: AppLocalizations.of(context)!.language,
        ),
        ConfigItem(
          text: languageProvider.appLanguage == 'ar'
              ? AppLocalizations.of(context)!.arabic
              : AppLocalizations.of(context)!.english,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const LanguageBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}