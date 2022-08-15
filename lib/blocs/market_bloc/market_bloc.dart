import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:stocks_market/data/models/market_active.dart';
import 'package:stocks_market/data/models/sectorPerfomance.dart';
import 'package:stocks_market/data/respositories/market_repository.dart';
import 'package:stocks_market/utils/locator.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(MarketInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final MarketRepository marketRepo = locator.get<MarketRepository>();
    on<MarketEvent>((event, emit) async {
      if (event is LoadMarketsEvent) {
        emit(MarketLoading());
        await connectivity.checkConnectivity().then((connStatus) async {
          if (connStatus != ConnectivityResult.none) {
            try {
              emit(MarketLoaded(
                  sectorPerformance: await marketRepo.getSectorPerformance(),
                  marketActive: await marketRepo.getMarketActive(),
                  marketGainer: await marketRepo.getMarketGainers(),
                  marketLoser: await marketRepo.getMarketLosers()));
            } catch (e) {
              emit(MarketError(errMessage: 'There was an unkwon error'));
            }
          } else {
            emit(MarketNoInternet());
          }
        });
      }
    });
  }
}
