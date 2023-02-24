import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;

  const NewsModel(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  );

  NewsModel copyWith({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
  }) {
    return NewsModel(
      author ?? this.author,
      title ?? this.title,
      description ?? this.description,
      url ?? this.url,
      urlToImage ?? this.urlToImage,
      publishedAt ?? this.publishedAt,
    );
  }

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt?.millisecondsSinceEpoch,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      map['author'] != null ? map["author"] ?? '' : null,
      map['title'] != null ? map["title"] ?? '' : null,
      map['description'] != null ? map["description"] ?? '' : null,
      map['url'] != null ? map["url"] ?? '' : null,
      map['urlToImage'] != null ? map["urlToImage"] ?? '' : null,
      map['publishedAt'] != null ? DateTime.fromMillisecondsSinceEpoch((map["publishedAt"]??0) ?? 0) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) => NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant NewsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.author == author &&
      other.title == title &&
      other.description == description &&
      other.url == url &&
      other.urlToImage == urlToImage &&
      other.publishedAt == publishedAt;
  }

  @override
  int get hashCode {
    return author.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      urlToImage.hashCode ^
      publishedAt.hashCode;
  }

  @override
  String toString() {
    return 'NewsModel(author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt)';
  }
}
