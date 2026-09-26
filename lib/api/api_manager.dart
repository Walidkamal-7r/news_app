import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/model/api_constants.dart';
import 'package:news/api/model/api_end_points.dart';
import 'package:news/api/model/sources/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.sourceApi, {
        'apiKey': ApiConstants.apiKey,
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
