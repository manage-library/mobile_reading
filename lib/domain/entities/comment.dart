import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  final String? content;
  final String? createdAt;
  final int? id;
  final User? user;
  final int? user_id;
  final int? book_id;
  final String? updatedAt;
  final List? raw;
  final int? affected;

  Comment({this.user_id, this.raw, this.affected, this.content, this.createdAt, this.book_id, this.id, this.user, this.updatedAt});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
