import 'package:flutter/material.dart';
import 'package:news/api/dio/CustomException.dart';
import 'package:news/api/model/news/articles.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  NewsRepository newsRepository;

  NewsViewModel({required this.newsRepository});

  List<News>? newsList;
  String? errorMessage;
  bool isLoading = true;

  Future<void> getNewsBySourceId(String sourceId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await newsRepository.getNewsBySourceId(sourceId);
      if (response.status == 'ok') {
        newsList = response.articles;
      } else {
        errorMessage = response.message ?? 'Something went wrong.';
      }
    } catch (e) {
      errorMessage = e is CustomException
          ? e.message
          : 'An unexpected error occurred. Please try again.';
    }

    isLoading = false;
    notifyListeners();
  }
}
