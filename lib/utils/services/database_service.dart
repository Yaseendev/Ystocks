import 'package:hive/hive.dart';
import 'package:stocks_market/data/models/search.dart';
import 'package:stocks_market/utils/constants.dart';

class DatabaseService {
  Future saveSymbol(String symbol) async {
    final symbolsBox = await getSymbolsBox();
    if (!symbolsBox.containsKey(symbol)) {
      symbolsBox.put(symbol, symbol);
    }
  }

  Future<bool> checkSymbol(String symbol) async {
    final symbolsBox = await getSymbolsBox();
    return symbolsBox.values.contains(symbol);
  }

  Future unsaveSymbol(String symbol) async {
    final symbolsBox = await getSymbolsBox();
    if (symbolsBox.containsKey(symbol)) {
      symbolsBox.delete(symbol);
    }
  }

  Future saveSearch(String symbol) async {
    final searchBox = await getSearchBox();
    if (!searchBox.containsKey(symbol)) {
      searchBox.put(symbol, symbol);
    }
  }

  Future<List<StockSearch>> fetchSearch() async {
    final searchBox = await getSearchBox();
    return searchBox.values
        .map((e) => StockSearch(symbol: e.toString()))
        .toList();
  }

  Future deleteSearch(String symbol) async {
    final searchBox = await getSearchBox();
    if (searchBox.containsKey(symbol)) {
      searchBox.delete(symbol);
    }
  }

  static Future<Box> getSymbolsBox() async {
    if (Hive.isBoxOpen(kSymbolsBoxName))
      return Hive.box(kSymbolsBoxName);
    else
      return await Hive.openBox(kSymbolsBoxName);
  }

  static Future<Box> getSearchBox() async {
    if (Hive.isBoxOpen(kSearchBoxName))
      return Hive.box(kSearchBoxName);
    else
      return await Hive.openBox(kSearchBoxName);
  }
}
