import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/search.dart';
import 'search_history_widget.dart';
import 'search_results_widget.dart';

class SearchList extends StatelessWidget {
  final List<StockSearch> data;
  final ListType listType;
  
  const SearchList({
    Key? key,
    required this.data,
    required this.listType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (BuildContext ctx, int i) {
          return listType == ListType.searchHistory
              ? SearchHistoryWidget(search: data[i])
              : SearchResultsWidget(search: data[i]);
        });
  }
}
