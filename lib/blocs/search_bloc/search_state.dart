part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchDataLoaded extends SearchState {
  final List<StockSearch> data;
  final ListType listType;

  SearchDataLoaded({required this.data, required this.listType});

@override
  List<Object?> get props => [data, listType];
}

class SearchResultsError extends SearchState {
  final String? message;

  SearchResultsError([this.message]);

  @override
  List<Object?> get props => [message];
}
