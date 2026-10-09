import 'package:news/api/model/sources/source.dart';

abstract class SourceStates {}

class SourceInitialStates extends SourceStates {}

class SourceLoadingStates extends SourceStates {}

class SourceSuccessStates extends SourceStates {
  List<Source> sourcesList;

  SourceSuccessStates({required this.sourcesList});
}

class SourceErrorStates extends SourceStates {
  String errorMessage;

  SourceErrorStates({required this.errorMessage});
}
