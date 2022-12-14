import 'package:stocks_market/data/models/search.dart';
import 'package:stocks_market/utils/locator.dart';
import 'package:stocks_market/utils/services/database_service.dart';
import 'package:stocks_market/utils/services/network_api_service.dart';

class SearchRepository {
  late final NetworkApiService _networkApiService;
  late final DatabaseService _databaseService;

  SearchRepository() {
    this._networkApiService = locator.get<NetworkApiService>();
    this._databaseService = locator.get<DatabaseService>();
  }

  Future<List<StockSearch>> fetchSearchResult(String symbol) async {
     final result = await _networkApiService.fetchSearchResult(symbol);
     return StockSearch.convertToList(result);
  }

  Future<List<StockSearch>> fetchSearchData() async {
    return await _databaseService.fetchSearch();
  }

  Future saveSearchData(String symbol) async {
    await _databaseService.saveSearch(symbol);
  }

  Future deleteSearchData(String symbol) async {
    await _databaseService.deleteSearch(symbol);
  }
}