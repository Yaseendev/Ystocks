import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/profile_bloc/profile_bloc.dart';
import 'package:stocks_market/blocs/search_bloc/search_bloc.dart';
import 'package:stocks_market/data/models/search.dart';
import 'package:stocks_market/presentation/screens/profile_screen.dart';

class SearchHistoryWidget extends StatelessWidget {

  final StockSearch search;

  SearchHistoryWidget({
    required this.search
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.history),
      title: Text(search.symbol),

      onTap: () {
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider<ProfileBloc>(
                  create: (context) => ProfileBloc()
                    ..add(FetchProfileData(symbol: search.symbol)),
                  child: ProfileScreen(symbol: search.symbol),
                ),
              ));
      },

      trailing: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(Icons.clear), 
        
        onPressed: () {
          BlocProvider
          .of<SearchBloc>(context)
          .add(DeleteSearch(symbol: search.symbol));
        }
      )
    );
  }
}