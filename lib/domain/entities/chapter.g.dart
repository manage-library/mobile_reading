// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      name: json['name'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'content': instance.content,
    };
