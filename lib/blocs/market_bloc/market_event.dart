part of 'market_bloc.dart';

abstract class MarketEvent extends Equatable {
  const MarketEvent();

  @override
  List<Object> get props => [];
}

class LoadMarketsEvent extends MarketEvent {
  @override
  List<Object> get props => [];
}
