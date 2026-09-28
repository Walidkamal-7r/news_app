import 'package:flutter/material.dart';
import 'package:news/api/dio/CustomException.dart';
import 'package:news/api/dio/dio_manager.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/ui/home/category_details/sources/source_tab.dart';
import 'package:news/ui/widgets/main_error_widget.dart';
import 'package:news/ui/widgets/main_loading_widget.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DioManager().getSources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MainLoadingWidget();
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            final errorMessage = error is CustomException
                ? error.message
                : 'An unexpected error occurred. Please try again.';

            return MainErrorWidget(
                errorMessage: errorMessage,
                onPressed: () {
                  DioManager().getSources(widget.category.id);
                  setState(() {});
                });
          } else if (snapshot.data?.status != 'ok') {
            return MainErrorWidget(
                errorMessage: snapshot.data?.message ?? 'Something went wrong.',
                onPressed: () {
                  DioManager().getSources(widget.category.id);
                  setState(() {});
                });
          } else {
            var sourcesList = snapshot.data?.sources ?? [];
            return SourceTab(sourcesList: sourcesList);
          }
        });
  }
}