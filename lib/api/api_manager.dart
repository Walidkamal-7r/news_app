import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/model/api_constants.dart';
import 'package:news/api/model/api_end_points.dart';
import 'package:news/api/model/news/news_response.dart';
import 'package:news/api/model/sources/source_response.dart';

class ApiManager {

  static Future<SourceResponse> getSources(String categoryId) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.sourceApi, {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId,
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNewBySourceId(String sourceId) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl,
          ApiEndPoints.newsApi,
          {
            'apiKey': ApiConstants.apiKey,
            'sources': sourceId
          }
      );
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
