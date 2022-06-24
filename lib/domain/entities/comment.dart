import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  final String? content;
  final String? createdAt;
  final int? id;
  final int? user_id;
  final int? book_id;
  final String? updatedAt;

  Comment({this.content, this.createdAt, this.book_id, this.id, this.user_id, this.updatedAt});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
