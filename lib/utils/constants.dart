import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const kSharpBorder = const BorderRadius.all(Radius.circular(2));
const kStandatBorder = const BorderRadius.all(Radius.circular(6));
final String? kFinancialModelingPrepApi = dotenv.env['FINANCIAL_API_KEY'];
const String kSymbolsBoxName = 'symbolsBox';

class Urls {
  static const String kAlphavantageUrl = 'www.alphavantage.co';
  static const String kMarketUrl = 'financialmodelingprep.com';
  static const String kMarketPath = '/api/v3';
  static const String kMarketStockPath = '$kMarketPath/stock';
  static const String kMarketStockActives = kMarketStockPath + '/actives';
  static const String kMarketStockGainers = kMarketStockPath + '/gainers';
  static const String kMarketStockLosers = kMarketStockPath + '/losers';
  static const String kMarketProfile = kMarketPath + '/company/profile/';
  static const String kMarketQuote = kMarketPath + '/quote/';
  static const String kMarketChart = kMarketPath + '/historical-price-full/';
}

class AppColors {
  static const kTileColor = const Color(0XFF181818);
  static const kNegativeColor = Color(0xFFF44336);
  static const kPositiveColor = const Color(0XFF17a862);
  static const kLightGray = const Color(0XFFcdcdcd);
  static const kLighterGray = const Color(0XFF898989);
  static const kGray = const Color(0XFF757575);
  static const kScaffoldBackground = const Color(0XFF0e0e0e);
  static const kTransparentWhite = const Color(0X88ffffff);
}

class TextStyles {
  static const kSubtitleStyling = const TextStyle(
    color: AppColors.kGray,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle kPositiveChange = const TextStyle(
    color: AppColors.kPositiveColor,
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle kNegativeChange = const TextStyle(
    color: AppColors.kNegativeColor,
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  static const kProfileCompanyName = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const kPriceStyle = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const kProfileScreenSectionTitle =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static const kSubtitleStyle =
      const TextStyle(color: AppColors.kLighterGray, fontSize: 14.5, height: 1.5);
}
