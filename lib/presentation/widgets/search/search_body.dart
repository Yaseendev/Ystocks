import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/search_bloc/search_bloc.dart';
import 'search_list.dart';
import 'search_loading.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchDataLoaded) {
          return SearchList(
            data: state.data,
            listType: state.listType,
          );
        }

        if (state is SearchResultsError) {
          return Center(
            child: Text(state.message ?? ''),
          );
        }

        return SearchLoadingWidget();
      },
    );
  }
}
