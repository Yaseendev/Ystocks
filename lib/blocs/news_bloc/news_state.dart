part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  final String message;

  NewsError({
    required this.message
  });
}

class NewsLoaded extends NewsState {
  final List<News> news;

  NewsLoaded({
    required this.news
  });
}
