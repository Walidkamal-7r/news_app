import 'package:dio/dio.dart';

class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  factory CustomException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return CustomException(
          'Connection timeout with the server. Please check your internet connection and try again.',
        );

      case DioExceptionType.badResponse:
        return CustomException(
          _handleStatusCode(
            dioException.response?.statusCode,
            dioException.response?.data,
          ),
        );

      case DioExceptionType.cancel:
        return CustomException('Request was cancelled.');

      case DioExceptionType.connectionError:
        return CustomException(
          'No internet connection. Please verify your network settings.',
        );

      case DioExceptionType.badCertificate:
        return CustomException('Invalid server certificate.');

      case DioExceptionType.unknown:
      default:
        return CustomException(
          'An unexpected error occurred. Please try again later.',
        );
    }
  }

  static String _handleStatusCode(int? statusCode, dynamic responseData) {
    final Map<String, String> newsApiErrorTranslations = {
      'apikeyinvalid': 'Invalid API key. Please check your configuration.',
      'apikeymissing':
          'API key is missing. Please make sure to include it in the request.',
      'apikeydisabled': 'Your API key has been disabled.',
      'ratelimited': 'You have exceeded your daily request limit. Please try again tomorrow.',
      'parameterinvalid':
          'Invalid search parameters. Please check your inputs.',
      'parametersmissing': 'Required search parameters are missing.',
      'sourcestoomany':
          'Too many sources selected. Please select fewer sources.',
      'sourcedoesnotexist': 'The requested news source does not exist.',
      'unexpectederror': 'An unexpected error occurred on the news server.',
    };

    String? errorCode;
    String? rawServerMessage;

    if (responseData is Map<String, dynamic>) {
      errorCode = responseData['code']?.toString().toLowerCase().trim();
      rawServerMessage = responseData['message']?.toString();
    }

    if (errorCode != null && newsApiErrorTranslations.containsKey(errorCode)) {
      return newsApiErrorTranslations[errorCode]!;
    }

    if (rawServerMessage != null && rawServerMessage.trim().isNotEmpty) {
      return rawServerMessage;
    }

    switch (statusCode) {
      case 400:
        return 'Bad request. Please verify the submitted data.';
      case 401:
        return 'Unauthorized access. Please check your API key.';
      case 429:
        return 'Rate limit exceeded. Too many requests sent to NewsAPI.';
      case 500:
      case 502:
      case 503:
        return 'News server is currently unavailable. Please try again later.';
      default:
        return 'An unknown error occurred ($statusCode). Please try again later.';
    }
  }

  @override
  String toString() => message;
}
