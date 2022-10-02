import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/news/news_data.dart';
import 'news_article_widget.dart';

class NewsCardWidget extends StatelessWidget {

  final String title;
  final List<NewsData> news;

  NewsCardWidget({
    required this.title,
    required this.news
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(),
        Text(this.title, style: const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800
)),
        Container(
          height: 225,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,

            itemCount: news.length,
            itemBuilder: (BuildContext context, int i) => Padding(
              padding: EdgeInsets.only(top: 8, right: 24),
              child: NewsArticleWidget(news[i])
            )
          ),
        )
      ],
    );
  }
}