import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/profile_bloc/profile_bloc.dart';
import 'package:stocks_market/data/models/market_active.dart';
import 'package:stocks_market/presentation/screens/profile_screen.dart';
import 'package:stocks_market/utils/constants.dart';

class MarketMoversListTile extends StatelessWidget {
  final Color color;
  final MarketMover marketMover;
  const MarketMoversListTile({Key? key, required this.color, required this.marketMover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 14),
        child: Container(
          child: GestureDetector(
            onTap: () {
              // Trigger fetch event.
              // BlocProvider.of<ProfileBloc>(context)
              //     .add(FetchProfileData(symbol: data.ticker));

              // Send to Profile.
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider<ProfileBloc>(
                            create: (context) => ProfileBloc()..add(FetchProfileData(symbol: marketMover.ticker)),
                            child: ProfileScreen(symbol: marketMover.ticker),
                          ),
                      ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(marketMover.ticker,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5)),

                SizedBox(height: 5),
                Text(marketMover.changesPercentage),
              ],
            ),
          ),
          width: 100,
          decoration: BoxDecoration(
            borderRadius: kStandatBorder,
            color: color,
          ),
        ));
  }
}
