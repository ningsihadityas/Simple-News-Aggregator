class ArticleModel {
  String title;
  String author;
  String description;
  String urlToImage;
  //DateTime publishedAt;
  String content;
  String url;

  ArticleModel(
      {this.title,
      this.description,
      this.author,
      this.content,
      // this.publishedAt,
      this.urlToImage,
      this.url});
}
