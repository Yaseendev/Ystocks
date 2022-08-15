import 'stock_chart.dart';
import 'stock_profile.dart';
import 'stock_quote.dart';

class Profile {
  final StockProfile stockProfile;
  final StockQuote stockQuote;
  final List<StockChart> stockChart;
  bool? symbolSaved;

  Profile({
    required this.stockProfile,
    required this.stockQuote,
    required this.stockChart,
    this.symbolSaved,
  });
}
