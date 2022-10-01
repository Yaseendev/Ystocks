import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/profile_bloc/profile_bloc.dart';
import 'package:stocks_market/data/respositories/profile_repository.dart';
import 'package:stocks_market/presentation/screens/profile_screen.dart';
import 'package:stocks_market/utils/locator.dart';

class StockCard extends StatelessWidget {
  final String symbol;
  const StockCard({Key? key,
  required this.symbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider<ProfileBloc>(
                  create: (context) => ProfileBloc()
                    ..add(FetchProfileData(symbol: symbol)),
                  child: ProfileScreen(symbol: symbol,),
                ),
              ));
        },
        leading: Icon(Icons.insights),
        title: Text(symbol),
        trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text('Remove Saved Stock'),
                  content: Text('Are you sure you want to unsave this stock?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: Text('Yes')),
                    TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: Text('No')),
                  ],
                );
              },
            ).then((value) {
              if (value != null) {
                if (value) {
                  //context.read<ProfileBloc>().add(UnSaveProfileData(symbol: stocks[index].toString()));
                  locator
                      .get<ProfileRepository>()
                      .unsaveStockData(symbol);
                }
              }
            });
          },
          icon: Icon(Icons.delete_forever),
          color: Colors.red,
        ),
      ),
 
   );
  }
}