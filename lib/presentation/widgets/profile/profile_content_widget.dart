import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/profile/profile.dart';
import 'package:stocks_market/utils/constants.dart';
import 'profile_chart.dart';
import 'statistics_widget.dart';
import 'stock_price_widget.dart';

class ProfileContent extends StatelessWidget {
  final Color color;
  final Profile profile;
  const ProfileContent({
    Key? key,
    required this.profile,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 26, right: 26, top: 26),
      children: [
        Text(profile.stockQuote.name ?? '-',
            style: TextStyles.kProfileCompanyName),
        StockPriceWidget(stockQuote: profile.stockQuote),
        Container(
          height: 250,
          padding: EdgeInsets.only(top: 26),
          child: ProfileChart(chart: profile.stockChart, color: this.color),
        ),
        StatisticsWidget(
          profile: profile,
        ),
      ],
    );
  }
}
