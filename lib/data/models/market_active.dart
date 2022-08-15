class MarketMover {
  final String ticker;
  final double changes;
  final String price;
  final String changesPercentage;
  final String companyName;

  MarketMover(
      {required this.ticker,
      required this.changes,
      required this.price,
      required this.changesPercentage,
      required this.companyName});

  factory MarketMover.fromJson(Map<String, dynamic> json) {
    return MarketMover(
      ticker: json['ticker'] ?? '',
      changes: json['changes'] ?? 0,
      price: json['price'] ?? '',
      changesPercentage: json['changesPercentage'] ?? '',
      companyName: json['companyName'] ?? '',
    );
  }
}
