import 'package:news/api/dio/dio_manager.dart';
import 'package:news/api/model/news/news_response.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  late DioManager dioManager;

  NewsRemoteDataSourceImpl({required this.dioManager});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    return dioManager.getNewsBySourceId(sourceId);
  }
}
