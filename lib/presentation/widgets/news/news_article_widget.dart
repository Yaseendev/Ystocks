import 'package:flutter/material.dart';
import 'package:stocks_market/data/models/news/news_data.dart';
import 'package:stocks_market/utils/services/url_helper.dart';

class NewsArticleWidget extends StatelessWidget {
  final NewsData newsData;
  const NewsArticleWidget(this.newsData);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(newsData.url),
      child: Container(
        width: 200,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                newsData.title,
                style: TextStyle(
                    height: 1.6,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFc2c2c2)),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: 125,
              decoration:
                  BoxDecoration(image: _imageIsValid(newsData.urlToImage)),
            ),
          ],
        ),
      ),
    );
  }

  DecorationImage _imageIsValid(String? url) {
    return url == null
        ? DecorationImage(image: AssetImage('assets/images/default.jpg'))
        : DecorationImage(image: NetworkImage(url));
  }
}
