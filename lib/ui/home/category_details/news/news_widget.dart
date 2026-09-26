import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/sources/source.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/ui/home/category_details/news/news_item.dart';
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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: snapshot.error.toString(),
            onPressed: () {
              ApiManager.getNewBySourceId(widget.source.id ?? '');
              setState(() {});
            },
          );
        } else if (snapshot.data?.status != 'ok') {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManager.getNewBySourceId(widget.source.id ?? '');
              setState(() {});
            },
          );
        } else {
          var newsList = snapshot.data?.articles ?? [];
          return newsList.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.noNews,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return NewsItem(news: newsList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.height * 0.02);
                  },
                  itemCount: newsList.length,
                );
        }
      },
    );
  }
}
