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
}
