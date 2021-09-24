import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paap_app/models/Article.dart';

class News {
  List<Article> news = <Article>[];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=cfdc9e8f8ba640959c91b58b0098385a";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
              element['author'],
              element['title'],
              element['description'],
              element['url'],
              element['urlToImage'],
              element['content'],
              element['publishedAt']);

          news.add(article);
        }
      });
    }
  }
}
