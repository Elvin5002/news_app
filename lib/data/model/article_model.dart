import 'package:news_app/domain/entities/article_entity.dart';

class ArticleModel {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        source: Source.fromJson(json["source"]),
        author: json["author"] as String?,
        title: json["title"] ?? '',
        description: json["description"] as String?,
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] as String?,
        publishedAt: DateTime.parse(
            json["publishedAt"] ?? DateTime.now().toIso8601String()),
        content: json["content"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] as String?,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

extension ArticleModelToEntity on ArticleModel {
  ArticleEntity toEntity() {
    return ArticleEntity(
      source: source,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}
