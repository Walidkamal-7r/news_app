import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/api/model/news/articles.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/ui/widgets/main_loading_widget.dart';
import 'package:news/utils/size_utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).splashColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => MainLoadingWidget(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${AppLocalizations.of(context)!.by}${news.author} ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Text(
                timeago.format(
                  DateTime.parse(
                    news.publishedAt ?? DateTime.now().toIso8601String(),
                  ),
                ),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
