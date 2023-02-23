import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class VideoModel {
  final String id;
  final String videoUrl;
  final String title;
  final String thumb;
  
  const VideoModel({
    required this.id,
    required this.videoUrl,
    required this.title,
    required this.thumb,
  });

  VideoModel copyWith({
    String? id,
    String? videoUrl,
    String? title,
    String? thumb,
  }) {
    return VideoModel(
      id: id ?? this.id,
      videoUrl: videoUrl ?? this.videoUrl,
      title: title ?? this.title,
      thumb: thumb ?? this.thumb,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'videoUrl': videoUrl,
      'title': title,
      'thumb': thumb,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: (map["id"] ?? '') as String,
      videoUrl: (map["videoUrl"] ?? '') as String,
      title: (map["title"] ?? '') as String,
      thumb: (map["thumb"] ?? '') as String,
    );
  }


  @override
  String toString() {
    return 'VideoModel(id: $id, videoUrl: $videoUrl, title: $title, thumb: $thumb)';
  }

  @override
  bool operator ==(covariant VideoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.videoUrl == videoUrl &&
      other.title == title &&
      other.thumb == thumb;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      videoUrl.hashCode ^
      title.hashCode ^
      thumb.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) => VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
