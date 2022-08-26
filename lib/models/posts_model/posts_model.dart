import 'package:collection/collection.dart';

class PostsModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostsModel({this.userId, this.id, this.title, this.body});

  @override
  String toString() {
    return 'PostsModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  factory PostsModel.fromJson(Map<dynamic, dynamic> json) => PostsModel(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PostsModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
}
