import 'package:news/utils/app_assets.dart';

class Category {
  String id;
  String title;
  String imagePath;

  Category({required this.id, required this.title, required this.imagePath});

  static List<Category> getCategoriesList(bool isDarkMode) {
    return [
      Category(
        id: 'general',
        title: 'General',
        imagePath: isDarkMode ? AppAssets.generalLight : AppAssets.generalDark,
      ),
      Category(
        id: 'business',
        title: 'Business',
        imagePath: isDarkMode
            ? AppAssets.businessLight
            : AppAssets.businessDark,
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
        imagePath: isDarkMode
            ? AppAssets.entertainmentLight
            : AppAssets.entertainmentDark,
      ),
      Category(
        id: 'health',
        title: 'Health',
        imagePath: isDarkMode ? AppAssets.healthLight : AppAssets.healthDark,
      ),
      Category(
        id: 'science',
        title: 'Science',
        imagePath: isDarkMode ? AppAssets.scienceLight : AppAssets.scienceDark,
      ),
      Category(
        id: 'technology',
        title: 'Technology',
        imagePath: isDarkMode
            ? AppAssets.technologyLight
            : AppAssets.technologyDark,
      ),
      Category(
        id: 'sports',
        title: 'Sports',
        imagePath: isDarkMode ? AppAssets.sportsLight : AppAssets.sportsDark,
      ),
    ];
  }
}
