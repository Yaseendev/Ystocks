import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/search_bloc/search_bloc.dart';
import '../widgets/search/search_body.dart';
import '../widgets/search/search_box.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) => SearchBloc()..add(FetchSearchHistory()),
      child: ListView(
        shrinkWrap: true,
        children: [
          SearchBox(),
          SearchBody(),
        ],
      ),
    );
  }
}
