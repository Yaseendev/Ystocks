import 'package:hive/hive.dart';
import 'package:stocks_market/utils/constants.dart';

class DatabaseService {
  Future saveSymbol(String symbol) async {
    final symbolsBox = await getSymbolsBox();
    if (!symbolsBox.values.contains(symbol)) {
      symbolsBox.add(symbol);
    }
  }

  Future<bool> checkSymbol(String symbol) async {
    final symbolsBox = await getSymbolsBox();
    return symbolsBox.values.contains(symbol);
  }

  static Future<Box> getSymbolsBox() async {
    if (Hive.isBoxOpen(kSymbolsBoxName))
      return Hive.box(kSymbolsBoxName);
    else
      return await Hive.openBox(kSymbolsBoxName);
  }
}
