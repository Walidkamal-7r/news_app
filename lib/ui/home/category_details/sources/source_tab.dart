import 'package:flutter/material.dart';
import 'package:news/api/model/sources/source.dart';
import 'package:news/ui/home/category_details/news/news_widget.dart';
import 'package:news/ui/home/category_details/sources/source_name.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/size_utils.dart';

class SourceTab extends StatefulWidget {
  List<Source> sourcesList;

  SourceTab({super.key, required this.sourcesList});

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        spacing: height * 0.02,
        children: [
          TabBar(
            isScrollable: true,
            dividerColor: AppColors.transparentColor,
            indicatorColor: Theme.of(context).splashColor,
            tabAlignment: TabAlignment.start,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourcesList.map((source) {
              return SourceName(
                source: source,
                isSelected: selectedIndex == widget.sourcesList.indexOf(source),
              );
            }).toList(),
          ),
          Expanded(
              child: NewsWidget(source: widget.sourcesList[selectedIndex])),
        ],
      ),
    );
  }
}
