import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/search_bloc/search_bloc.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 15.5),
                border: InputBorder.none,
              ),
              onChanged: (val) {
                val.isNotEmpty
                    ? context
                        .read<SearchBloc>()
                        .add(FetchSearchResult(symbol: val.toUpperCase()))
                    : context.read<SearchBloc>().add(FetchSearchHistory());
              },
            ),
          ),
        ],
      ),
    );
  }
}
