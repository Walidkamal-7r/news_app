import 'package:news/api/model/news/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
}
