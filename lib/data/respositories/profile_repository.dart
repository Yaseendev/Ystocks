import 'package:stocks_market/data/models/profile/profile.dart';
import 'package:stocks_market/data/models/profile/stock_chart.dart';
import 'package:stocks_market/utils/constants.dart';
import 'package:stocks_market/utils/locator.dart';
import 'package:stocks_market/utils/services/database_service.dart';
import 'package:stocks_market/utils/services/network_api_service.dart';

import '../models/profile/stock_profile.dart';
import '../models/profile/stock_quote.dart';

class ProfileRepository {
  late final NetworkApiService _networkApiService;
  late final DatabaseService _databaseService;

  ProfileRepository() {
    this._networkApiService = locator.get<NetworkApiService>();
    this._databaseService = locator.get<DatabaseService>();
  }

  Future<Profile?> fetchStockData(String symbol) async {
    final stockProfile = await _networkApiService.fetchMarket(
        Urls.kMarketProfile + symbol,
        params: {'apikey': kFinancialModelingPrepApi});
    final stockQuote = await _networkApiService.fetchMarket(
        Urls.kMarketQuote + symbol,
        params: {'apikey': kFinancialModelingPrepApi});
    final DateTime date = DateTime.now();
    final stockChart = await _networkApiService.fetchMarket(
      Urls.kMarketChart + symbol,
      params: {
        'from': '${date.year - 1}-${date.month}-${date.day}',
        'to': '${date.year}-${date.month}-${date.day - 1}',
        'apikey': kFinancialModelingPrepApi,
      },
    );

    return Profile(
      stockQuote: StockQuote.fromJson(stockQuote?[0]),
      stockProfile: StockProfile.fromJson(stockProfile?['profile']),
      stockChart: StockChart.toList(stockChart?['historical']),
      symbolSaved: await _databaseService.checkSymbol(symbol),
    );
  }
}
