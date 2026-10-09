import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/home/category_details/news/cubit/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsLoadingStates());

  Future<void> getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingStates());
      var response = await ApiManager.getNewBySourceId(sourceId);
      if (response.status == 'error') {
        emit(NewsErrorStates(errorMessage: response.message!));
        return;
      } else if (response.status == 'ok') {
        emit(NewsSuccessStates(newsList: response.articles ?? []));
        return;
      }
    } catch (e) {
      emit(NewsErrorStates(errorMessage: e.toString()));
    }
  }
}
