import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/profile/stock_quote.dart';
import 'package:stocks_market/utils/color_helper.dart';
import 'package:stocks_market/utils/constants.dart';
import 'package:stocks_market/utils/services/text_helper.dart';

class StockPriceWidget extends StatelessWidget {
  const StockPriceWidget({
    Key? key,
    required this.stockQuote,
  }) : super(key: key);

  final StockQuote stockQuote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${formatText(stockQuote.price)}',
              style: TextStyles.kPriceStyle),
          SizedBox(height: 8),
          Text(
              '${determineTextBasedOnChange(stockQuote.change ?? 0)}  (${determineTextPercentageBasedOnChange(stockQuote.changesPercentage ?? 0)})',
              style: determineTextStyleBasedOnChange(stockQuote.change ?? 0))
        ],
      ),
    );
  }
}
