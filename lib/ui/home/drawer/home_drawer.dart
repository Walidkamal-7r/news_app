import 'package:flutter/material.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/ui/home/drawer/widgets/config_item.dart';
import 'package:news/ui/home/drawer/widgets/divider_item.dart';
import 'package:news/ui/home/drawer/widgets/drawer_item.dart';
import 'package:news/utils/app_assets.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/utils/size_utils.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
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
            //todo : go to home
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
          text: AppLocalizations.of(context)!.dark,
          onPressed: () {
            //todo : theme bottom sheet
          },
        ),
        DividerItem(),
        DrawerItem(
          iconName: AppAssets.languageIcon,
          text: AppLocalizations.of(context)!.language,
        ),
        ConfigItem(
          text: AppLocalizations.of(context)!.english,
          onPressed: () {
            //todo :  language bottom sheet
          },
        ),
      ],
    );
  }
}
