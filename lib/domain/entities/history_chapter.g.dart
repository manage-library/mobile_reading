// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryBook _$HistoryBookFromJson(Map<String, dynamic> json) => HistoryBook(
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      book_id: json['book_id'] as int?,
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      book: json['book'] == null
          ? null
          : Book.fromJson(json['book'] as Map<String, dynamic>),
      chapter: json['chapter'] == null
          ? null
          : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryBookToJson(HistoryBook instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'user_id': instance.user_id,
      'book_id': instance.book_id,
      'book': instance.book?.toJson(),
      'chapter': instance.chapter?.toJson(),
    };
