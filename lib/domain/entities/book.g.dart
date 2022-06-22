// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      bookCategory: (json['bookCategory'] as List<dynamic>?)
          ?.map((e) => BookCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLike: json['isLike'] as int?,
      countChapter: json['countChapter'] as int?,
      countLike: json['countLike'] as int?,
      countDownload: json['countDownload'] as int?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      isVip: json['isVip'] as int?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      releaseStatus: json['releaseStatus'] as String?,
      listChapter: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'isVip': instance.isVip,
      'releaseStatus': instance.releaseStatus,
      'author': instance.author?.toJson(),
      'bookCategory': instance.bookCategory?.map((e) => e.toJson()).toList(),
      'isLike': instance.isLike,
      'countChapter': instance.countChapter,
      'countLike': instance.countLike,
      'countDownload': instance.countDownload,
    };
