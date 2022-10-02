import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:stocks_market/data/models/search.dart';
import 'package:stocks_market/data/respositories/search_repository.dart';
import 'package:stocks_market/utils/locator.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    final SearchRepository searchRepo = locator.get<SearchRepository>();
    on<SearchEvent>((event, emit) async {
      if (event is FetchSearchHistory) {
         _fetchSavedSearches(emit, searchRepo);
      } else if (event is SaveSearchHistory) {
        await searchRepo.saveSearchData(event.symbol);
        _fetchSavedSearches(emit, searchRepo);
      } else if (event is DeleteSearch) {
        await searchRepo.deleteSearchData(event.symbol);
        _fetchSavedSearches(emit, searchRepo);
      } else if(event is FetchSearchResult) {
        final Connectivity connectivity = locator.get<Connectivity>();
        await connectivity.checkConnectivity().then((connStatus) async {
          if (connStatus != ConnectivityResult.none) {
            try {
              emit(SearchDataLoaded(
                data: await searchRepo.fetchSearchResult(event.symbol),
                listType: ListType.searchResults,
              ));
            } catch (e) {
              emit(SearchResultsError('There was an unkwon error'));
            }
          } else {
            emit(SearchResultsError('No Internet Connection'));
          }
        });
      }
    });
  }

  void _fetchSavedSearches(Emitter<SearchState> emit,
      SearchRepository searchRepo) async {
    emit(SearchLoading());
    await searchRepo.fetchSearchData().then((result) {
      result.isNotEmpty
          ? emit(
              SearchDataLoaded(data: result, listType: ListType.searchHistory))
          : SearchResultsError('No Recent Searches');
    }).onError((error, stackTrace) {
      emit(SearchResultsError('Unknown Error Occured'));
    });
  }
}
