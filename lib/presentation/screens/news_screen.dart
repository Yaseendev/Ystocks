import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/news_bloc/news_bloc.dart';

import '../widgets/news/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {

        if (state is NewsInitial) {
          BlocProvider
          .of<NewsBloc>(context)
          .add(FetchNews());
        }
        
        if (state is NewsError) {
          return Center(
            child: Text(state.message),
          );
        } 

        if(state is NewsLoaded) {
           return RefreshIndicator(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all( 16),
        itemCount: state.news.length,
        itemBuilder: (BuildContext context, int index) {

              // Ensure that we don't have empty headlines.
              if (state.news[index].news.isEmpty ) {
                return Center(child:Text('There are no news related to ${state.news[index].keyWord}.'),);
              }

              return NewsCardWidget(
                title: state.news[index].keyWord,
                news: state.news[index].news,
              );
            },
      ),

      onRefresh: () async {
        // Reload markets section.
        BlocProvider
        .of<NewsBloc>(context)
        .add(FetchNews());
      },
    );
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
