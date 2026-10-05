import 'package:dio/dio.dart';
import 'package:news/api/dio/CustomException.dart';
import 'package:news/api/model/api_constants.dart';
import 'package:news/api/model/api_end_points.dart';
import 'package:news/api/model/news/news_response.dart';
import 'package:news/api/model/sources/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'X-Api-Key': ApiConstants.apiKey},
    ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
        );

  DioManager() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }

  Future<SourceResponse> getSources(String categoryId) async {
    try {
      var response = await dio.get(
        ApiEndPoints.sourceApi,
        queryParameters: {'category': categoryId},
      );
      return SourceResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw CustomException.fromDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      var response = await dio.get(
        ApiEndPoints.newsApi,
        queryParameters: {'sources': sourceId},
      );
      return NewsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw CustomException.fromDioException(e);
    } catch (e) {
      rethrow;
    }
  }
}
