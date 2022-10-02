import 'package:stocks_market/data/models/news/news_data.dart';
import 'package:stocks_market/utils/locator.dart';
import 'package:stocks_market/utils/services/network_api_service.dart';

import '../models/news/news.dart';

class NewsRepository {
  late final NetworkApiService _networkApiService;

  NewsRepository() {
    this._networkApiService = locator.get<NetworkApiService>();
  }
  
Future<News> fetchNews([String? title]) async {
  final result = await _networkApiService.fetchNews(title);
  return News(
      keyWord: title ?? '',
      news: NewsData.toList(result?['articles']),
    );
  }

}