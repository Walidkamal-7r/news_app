import 'package:news/api/model/news/articles.dart';

abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsLoadingStates extends NewsStates {}

class NewsSuccessStates extends NewsStates {
  List<News> newsList;

  NewsSuccessStates({required this.newsList});
}

class NewsErrorStates extends NewsStates {
  String errorMessage;

  NewsErrorStates({required this.errorMessage});
}
