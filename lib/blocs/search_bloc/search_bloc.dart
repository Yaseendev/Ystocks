import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:stocks_market/data/models/search.dart';
import 'package:stocks_market/utils/locator.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is FetchSearchHistory) {
        final Connectivity connectivity = locator.get<Connectivity>();
        await connectivity.checkConnectivity().then((connStatus) async {
          if (connStatus != ConnectivityResult.none) {
            emit(SearchLoading());
          } else {
            emit(SearchNoInternet());
          }
        });
      }
    });
  }
}
