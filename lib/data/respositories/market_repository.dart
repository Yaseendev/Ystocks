import 'package:stocks_market/data/models/market_active.dart';
import 'package:stocks_market/utils/constants.dart';
import 'package:stocks_market/utils/locator.dart';
import 'package:stocks_market/utils/services/network_api_service.dart';
import '../models/sectorPerfomance.dart';

class MarketRepository {
  late final NetworkApiService _networkApiService;

  MarketRepository() {
    this._networkApiService = locator.get<NetworkApiService>();
  }

  Future<SectorPerformance?> getSectorPerformance() async {
    final result = await _networkApiService.fetchSectorPerformance();
    return SectorPerformance.fromJson(result!['Rank A: Real-Time Performance']);
  }

  Future<List<MarketMover>?> getMarketActive() async {
    final result =
        await _networkApiService.fetchMarket(Urls.kMarketStockActives, params: {'apikey': kFinancialModelingPrepApi});
    return (result!['mostActiveStock'] as List<dynamic>)
        .map((item) => MarketMover.fromJson(item))
        .toList();
  }

  Future<List<MarketMover>?> getMarketGainers() async {
    final result =
        await _networkApiService.fetchMarket(Urls.kMarketStockGainers,
        params: {'apikey': kFinancialModelingPrepApi});
    return (result!['mostGainerStock'] as List<dynamic>)
        .map((item) => MarketMover.fromJson(item))
        .toList();
  }

  Future<List<MarketMover>?> getMarketLosers() async {
    final result =
        await _networkApiService.fetchMarket(Urls.kMarketStockLosers,
        params: {'apikey': kFinancialModelingPrepApi});
    return (result!['mostLoserStock'] as List<dynamic>)
        .map((item) => MarketMover.fromJson(item))
        .toList();
  }
}
