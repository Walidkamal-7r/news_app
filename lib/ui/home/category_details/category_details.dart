import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
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
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MainLoadingWidget();
          } else if (snapshot.hasError) {
            return MainErrorWidget(
                errorMessage: snapshot.error.toString(),
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }
            );
          } else if (snapshot.data?.status != 'ok') {
            return MainErrorWidget(
                errorMessage: snapshot.data!.message!,
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }
            );
          } else {
            var sourcesList = snapshot.data?.sources ?? [];
            return SourceTab(sourcesList: sourcesList);
          }
        }
    );
  }
}
