import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/market_active.dart';

import 'market_movers_listTile.dart';

class MarketMoversListView extends StatelessWidget {
  final Color color;
  final List<MarketMover> stocks;
  const MarketMoversListView(
      {Key? key, required this.color, required this.stocks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: stocks.length,
          itemBuilder: (BuildContext context, int index) => MarketMoversListTile(
                marketMover: stocks[index],
                color: color,
              )),
    );
  }
}
