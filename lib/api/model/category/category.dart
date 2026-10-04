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
        imagePath: isDarkMode ? AppAssets.generalDark : AppAssets.generalLight,
      ),
      Category(
        id: 'business',
        title: 'Business',
        imagePath: isDarkMode
            ? AppAssets.businessDark
            : AppAssets.businessLight,
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
        imagePath: isDarkMode
            ? AppAssets.entertainmentDark
            : AppAssets.entertainmentLight,
      ),
      Category(
        id: 'health',
        title: 'Health',
        imagePath: isDarkMode ? AppAssets.healthDark : AppAssets.healthLight,
      ),
      Category(
        id: 'science',
        title: 'Science',
        imagePath: isDarkMode ? AppAssets.scienceDark : AppAssets.scienceLight,
      ),
      Category(
        id: 'technology',
        title: 'Technology',
        imagePath: isDarkMode
            ? AppAssets.technologyDark
            : AppAssets.technologyLight,
      ),
      Category(
        id: 'sports',
        title: 'Sports',
        imagePath: isDarkMode ? AppAssets.sportsDark : AppAssets.sportsLight,
      ),
    ];
  }
}
