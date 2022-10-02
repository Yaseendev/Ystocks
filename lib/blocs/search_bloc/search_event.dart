part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchHistory extends SearchEvent {}

class SaveSearchHistory extends SearchEvent {
  final String symbol;

  SaveSearchHistory(this.symbol);

  @override
  List<Object> get props => [symbol];
}

class DeleteSearch extends SearchEvent {
  final String symbol;

  DeleteSearch({required this.symbol});

  @override
  List<Object> get props => [symbol];
}

class FetchSearchResult extends SearchEvent {
   final String symbol;

  FetchSearchResult({required this.symbol});

  @override
  List<Object> get props => [symbol];
}