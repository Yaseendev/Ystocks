class NewsData{
    final String source;
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;

  NewsData({
    required this.source,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      source: json['source']['name'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }

  static List<NewsData> toList(List<dynamic> items) {
    return items
    .map((item) => NewsData.fromJson(item))
    .toList();
  }
}