// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      book_id:  json['book_id'] as int?
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id' : instance.id,
      'name': instance.name,
      'description': instance.description,
      'content': instance.content,
      'book_id' : instance.book_id,
    };
