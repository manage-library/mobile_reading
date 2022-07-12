// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      user_id: json['user_id'] as int?,
      raw: json['raw'] as List<dynamic>?,
      affected: json['affected'] as int?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String?,
      book_id: json['book_id'] as int?,
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'content': instance.content,
      'createdAt': instance.createdAt,
      'id': instance.id,
      'user': instance.user?.toJson(),
      'user_id': instance.user_id,
      'book_id': instance.book_id,
      'updatedAt': instance.updatedAt,
      'raw': instance.raw,
      'affected': instance.affected,
    };
