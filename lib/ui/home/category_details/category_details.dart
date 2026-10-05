import 'package:flutter/material.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/ui/home/category_details/source_view_model.dart';
import 'package:news/ui/home/category_details/sources/source_tab.dart';
import 'package:news/ui/widgets/main_error_widget.dart';
import 'package:news/ui/widgets/main_loading_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SourceViewModel()..getSources(widget.category.id),
      child: Consumer<SourceViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return MainLoadingWidget();
          } else if (vm.errorMessage != null) {
            return MainErrorWidget(
              errorMessage: vm.errorMessage!,
              onPressed: () => vm.getSources(widget.category.id),
            );
          } else {
            return SourceTab(sourcesList: vm.sourcesList ?? []);
          }
        },
      ),
    );
  }
}