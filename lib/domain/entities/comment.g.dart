// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String?,
      book_id: json['book_id'] as int?,
      id: json['id'] as int?,
      user: json['user'] == null ? null : User.fromJson(json['user'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String?
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'content': instance.content,
       'createdAt' : instance.createdAt,
       'updatedAt' : instance.updatedAt,
       'book_id' : instance.book_id,
       'id' : instance.id,
      'user': instance.user?.toJson(),
};
