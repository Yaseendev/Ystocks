import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:stocks_market/data/models/news/news.dart';
import 'package:stocks_market/data/respositories/news_repository.dart';
import 'package:stocks_market/utils/locator.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final NewsRepository newsRepository = NewsRepository();
    on<NewsEvent>((event, emit) async {
      if (event is FetchNews) {
        await connectivity.checkConnectivity().then((connStatus) async {
          if (connStatus != ConnectivityResult.none) {
            emit(NewsLoading());
            try {
              final news = await Future.wait([
                'Dow Jones',
                'S&P 500',
                'Nasdaq'
              ].map((symbol) async => await newsRepository.fetchNews(symbol)));

              emit(NewsLoaded(news: news));
            } catch (e) {
              emit(NewsError(message: 'There was an error loading news'));
            }
          } else {
            emit(NewsError(message: 'No Internet Connection'));
          }
        });
      }
    });
  }
}
