import 'dart:convert';

import '../model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  // ignore: non_constant_identifier_names
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=61c21fa7c6684fd180959084b73ceaae';

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              //  publishedAt: element['publishedAt'],
              content: element['context ']);

          news.add(articleModel);
        }
      });
    }
  }
}
