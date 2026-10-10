import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/model/sources/source.dart';
import 'package:news/di/di.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/ui/home/category_details/news/cubit/news_cubit.dart';
import 'package:news/ui/home/category_details/news/cubit/news_states.dart';
import 'package:news/ui/home/category_details/news/news_item.dart';
import 'package:news/ui/home/category_details/news/news_view_model.dart';
import 'package:news/ui/widgets/main_error_widget.dart';
import 'package:news/ui/widgets/main_loading_widget.dart';
import 'package:news/utils/size_utils.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel(
      newsRepository: injectNewsRepository());

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getNewsBySourceId(widget.source.id ?? '');
    }
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
        bloc: NewsCubit()
          ..getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, state) {
          if (state is NewsLoadingStates) {
            return MainLoadingWidget();
          } else if (state is NewsErrorStates) {
            return MainErrorWidget(
              errorMessage: state.errorMessage,
              onPressed: () {
                context.read<NewsCubit>().getNewsBySourceId(
                    widget.source.id ?? '');
              },
            );
          } else if (state is NewsSuccessStates) {
            final newsList = state.newsList;
            if (newsList.isEmpty) {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.noNews,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) => NewsItem(news: newsList[index]),
              separatorBuilder: (context, index) =>
                  SizedBox(height: context.height * 0.02),
              itemCount: newsList.length,
            );
          }
          return Container(); //UnReachable.
        }
    );
  }
}

// for view model :
//   ChangeNotifierProvider.value(
//   value: viewModel,
//   child: Consumer<NewsViewModel>(
//     builder: (context, vm, _) {
//       if (vm.isLoading) {
//         return MainLoadingWidget();
//       } else if (vm.errorMessage != null) {
//         return MainErrorWidget(
//           errorMessage: vm.errorMessage!,
//           onPressed: () => vm.getNewsBySourceId(widget.source.id ?? ''),
//         );
//       } else {
//         final newsList = vm.newsList ?? [];
//         if (newsList.isEmpty) {
//           return Center(
//             child: Text(
//               AppLocalizations.of(context)!.noNews,
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           );
//         }
//         return ListView.separated(
//           itemBuilder: (context, index) => NewsItem(news: newsList[index]),
//           separatorBuilder: (context, index) =>
//               SizedBox(height: context.height * 0.02),
//           itemCount: newsList.length,
//         );
//       }
//     },
//   ),
// );

