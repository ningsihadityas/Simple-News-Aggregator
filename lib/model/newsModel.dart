class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;
  bool status;

  Posts({this.userId, this.id, this.title, this.body, this.status});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return new Posts(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
        status: false);
  }
}

// class Source {
//   int id;
//   String name;

//   Source({this.id, this.name});
//   @override
//   String toString() {
//     return 'Article{id: $id, title: $name}';
//   }

//   factory Source.fromJson(Map<String, dynamic> json) {
//     return Source(id: json["id"], name: json["name"]);
//   }
// }

// class Article {
//   List<Source> source;
//   String title;
//   String author;
//   String description;
//   String urlToImage;
//   DateTime publishedAt;
//   String content;
//   String articleUrl;

//   Article(
//       {this.source,
//       this.title,
//       this.description,
//       this.author,
//       this.content,
//       this.publishedAt,
//       this.urlToImage,
//       this.articleUrl});

//   factory Article.fromJson(Map<String, dynamic> json) {
//     var listSources = json["source"] as List;

//     var iterableSources = listSources.map((source) {
//       return Source.fromJson(source);
//     });

//     var source = List<Source>.from(iterableSources);

//     return Article(
//         source: source,
//         title: json["title"],
//         description: json["description"],
//         author: json["author"],
//         content: json["content"],
//         publishedAt: json["publishedAt"],
//         urlToImage: json["urlToImage"],
//         articleUrl: json["url"]);
//   }
// }

// // class Sample {
// //   String name;
// //   int age;
// //   List<String> hobi;
// //   Github github;
// //   List<Article> articles;
// //   Sample({this.name, this.age, this.hobi, this.github, this.articles});
// //   @override
// //   String toString() {
// //     return 'Sample{name: $name, age: $age, hobi: $hobi, github: $github, articles: $articles}';
// //   }

// //   factory Sample.fromJson(Map<String, dynamic> json) {
// //     // baca property articles sebagai List (JSON Array)
// //     var listArticles = json["articles"] as List;
// //     // mapping listArticles kedalam bentuk MappedIterable<dynamic, Article>
// //     var iterableArticles = listArticles.map((article) {
// //       return Article.fromJson(article);
// //     });
// //     // lalu, kita konversi dari MappedIterable kedalam bentuk List<Article>
// //     var articles = List<Article>.from(iterableArticles);
// //     return Sample(
// //       name: json["name"],
// //       age: json["age"],
// //       hobi: List<String>.from(json["hobi"]),
// //       github: Github.fromJson(json["github"]),
// //       articles: articles,
// //     );
// //   }
// // }

// // class News {
// //   List<Article> news = [];

// //   Future<void> getNews() async {
// //     String url =
// //         "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";

// //     var response = await http.get(url);

// //     var jsonData = jsonDecode(response.body);

// //     if (jsonData['status'] == "ok") {
// //       jsonData["articles"].forEach((element) {
// //         if (element['urlToImage'] != null && element['description'] != null) {
// //           Article article = Article(
// //             title: element['title'],
// //             author: element['author'],
// //             description: element['description'],
// //             urlToImage: element['urlToImage'],
// //             publshedAt: DateTime.parse(element['publishedAt']),
// //             content: element["content"],
// //             articleUrl: element["url"],
// //           );
// //           news.add(article);
// //         }
// //       });
// //     }
// //   }
// // }
