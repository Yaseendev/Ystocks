import 'package:dio/dio.dart';
import 'package:stocks_market/utils/constants.dart';

class NetworkApiService {
  final Dio _dio;

  NetworkApiService(this._dio);

  Future<Map<String, dynamic>?> fetchSectorPerformance() async {
    Response response = await _dio.getUri(Uri.https(Urls.kAlphavantageUrl,
        '/query', {'function': 'SECTOR', 'apikey': 'demo'}));
    return response.data;
  }

  Future<dynamic> fetchMarket(String endpoint, {Map<String,dynamic>? params}) async {
    Response response = await _dio.getUri(Uri.https(
        Urls.kMarketUrl, endpoint, params));
    return response.data;
  }
  
  Future<Map<String, dynamic>?> fetchProfile(String endpoint) async {
    Response response = await _dio.getUri(Uri.https(
        Urls.kMarketUrl, endpoint, {'apikey': kFinancialModelingPrepApi}));
    return response.data;
  }

  Future<dynamic> fetchSearchResult(String symbol) async {
    final Uri uri = Uri.https(Urls.kAlphavantageUrl, Urls.kQueryPath, {
      'function': 'SYMBOL_SEARCH',
      'keywords': symbol,
      'apikey': kAlphaVantageKey
    });
    final Response response = await _dio.getUri(uri);
    return response.data['bestMatches'];
  }

  Future<Map<String, dynamic>?> fetchNews([String? title]) async {
     final Uri newsUri = Uri.https(Urls.kNewsUrl, Urls.kNewsPath, {
      'q': '"$title"',
      'language': 'en',
      'sortBy': 'popularity',
      'pageSize': '10',
      'apikey': kNewsKey
    });
    final Response response = await _dio.getUri(newsUri);
    return response.data;
  }

 
}
