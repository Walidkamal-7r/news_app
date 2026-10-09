import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/home/category_details/sources/cubit/source_states.dart';

class SourceCubit extends Cubit<SourceStates> {
  SourceCubit() : super(SourceInitialStates());

  Future<void> getSources(String categoryId) async {
    try {
      //todo : loading
      emit(SourceLoadingStates());
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        // todo : error
        emit(SourceErrorStates(errorMessage: response.message!));
        return;
      } else if (response.status == 'ok') {
        //todo data
        emit(SourceSuccessStates(sourcesList: response.sources ?? []));
        return;
      }
    } catch (e) {
      //todo error
      emit(SourceErrorStates(errorMessage: e.toString()));
    }
  }
}
