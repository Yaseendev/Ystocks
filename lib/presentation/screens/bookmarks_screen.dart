import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks_market/blocs/profile_bloc/profile_bloc.dart';
import 'package:stocks_market/data/respositories/profile_repository.dart';
import 'package:stocks_market/utils/locator.dart';

import '../widgets/stock/stock_card.dart';
import 'profile_screen.dart';

class BookmarksScreen extends StatelessWidget {
  final Box symbolsBox;
  const BookmarksScreen({
    Key? key,
    required this.symbolsBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Stocks'),
      ),
      body: ValueListenableBuilder(
        valueListenable: symbolsBox.listenable(),
        builder: (context, Box<dynamic> box, _) {
          final stocks = box.values.toList();
          return stocks.length > 0
              ? ListView.builder(
                  itemCount: stocks.length,
                  itemBuilder: (context, index) {
                    return StockCard(symbol: stocks[index].toString());
                  })
              : Center(
                  child: Text(
                    'No Saved Stocks',
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
