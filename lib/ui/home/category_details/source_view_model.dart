import 'package:flutter/material.dart';
import 'package:news/api/dio/CustomException.dart';
import 'package:news/api/model/sources/source.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';

class SourceViewModel extends ChangeNotifier {
  SourceRepository sourceRepository;

  SourceViewModel({
    required this.sourceRepository,
  });

  List<Source>? sourcesList;
  String? errorMessage;
  bool isLoading = true;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await sourceRepository.getSources(categoryId);
      if (response.status == 'ok') {
        sourcesList = response.sources;
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
