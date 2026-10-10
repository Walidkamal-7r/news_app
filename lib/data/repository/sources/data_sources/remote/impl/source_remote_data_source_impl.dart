import 'package:news/api/dio/dio_manager.dart';
import 'package:news/api/model/sources/source_response.dart';
import 'package:news/data/repository/sources/data_sources/remote/source_remote_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  DioManager dioManager;

  SourceRemoteDataSourceImpl({required this.dioManager});

  @override
  Future<SourceResponse> getSources(String categoryId) {
    return dioManager.getSources(categoryId);
  }
}
