import 'dart:convert';

import 'package:flutter/foundation.dart';

class NoteModel {
  final String uid;
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? photo;
  final List<String>? photos;

  NoteModel({
    required this.uid,
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.photos,
    this.photo,
  });

  NoteModel copyWith({
    String? uid,
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? photos,
    String? photo,
  }) {
    return NoteModel(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      photos: photos ?? this.photos,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'photos': photos,
      'photo': photo,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      uid: map['uid'] ?? '',
      id: (map["id"] ?? '') as String,
      title: (map["title"] ?? '') as String,
      content: (map["content"] ?? '') as String,
      createdAt:
          DateTime.fromMillisecondsSinceEpoch((map["createdAt"] ?? 0) as int),
      updatedAt:
          DateTime.fromMillisecondsSinceEpoch((map["updatedAt"] ?? 0) as int),
      photos: map['photos'] != null
          ? List<String>.from(
              ((map['photos']) as List<String>),
            )
          : null,
      photo: (map["photo"] ?? '') as String,
    );
  }

  @override
  String toString() {
    return 'NoteModel(uid: $uid, id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, photos: $photos, photo: $photo)';
  }

  @override
  bool operator ==(covariant NoteModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uid == uid &&
        other.title == title &&
        other.content == content &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        listEquals(other.photos, photos) &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        title.hashCode ^
        content.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        photos.hashCode ^
        photo.hashCode;
  }
}
