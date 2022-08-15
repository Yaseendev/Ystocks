part of 'market_bloc.dart';

abstract class MarketState extends Equatable {
  const MarketState();

  @override
  List<Object?> get props => [];
}

class MarketInitial extends MarketState {
  @override
  List<Object?> get props => [];
}

class MarketLoading extends MarketState {
  @override
  List<Object?> get props => [];
}

class MarketError extends MarketState {
  final String errMessage;
  MarketError({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}

class MarketLoaded extends MarketState {
  final SectorPerformance? sectorPerformance;
  final List<MarketMover>? marketActive;
  final List<MarketMover>? marketGainer;
  final List<MarketMover>? marketLoser;

  MarketLoaded(
      {required this.sectorPerformance,
      required this.marketActive,
      required this.marketGainer,
      required this.marketLoser});

  @override
  List<Object?> get props =>
      [sectorPerformance, marketActive, marketGainer, marketLoser];
}

class MarketNoInternet extends MarketState {
  @override
  List<Object?> get props => [];
}
