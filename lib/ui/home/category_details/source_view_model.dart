import 'package:flutter/material.dart';
import 'package:news/api/dio/CustomException.dart';
import 'package:news/api/dio/dio_manager.dart';
import 'package:news/api/model/sources/source.dart';

class SourceViewModel extends ChangeNotifier {
  final DioManager _dioManager = DioManager();

  List<Source>? sourcesList;
  String? errorMessage;
  bool isLoading = true;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await _dioManager.getSources(categoryId);
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
