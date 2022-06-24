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
      is_vip: json['is_vip'] as bool?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      rate: json['rate'] == null
          ? null
          : BookRatingModel.fromJson(json['rate'] as Map<String, dynamic>),
      release_status: json['release_status'] as int?,
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      author_description: json['author_description'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'is_vip': instance.is_vip,
      'release_status': instance.release_status,
      'author': instance.author?.toJson(),
      'author_description': instance.author_description,
      'bookCategory': instance.bookCategory?.map((e) => e.toJson()).toList(),
      'isLike': instance.isLike,
      'countChapter': instance.countChapter,
      'countLike': instance.countLike,
      'countDownload': instance.countDownload,
      'rate': instance.rate?.toJson(),
      'chapters': instance.chapters?.map((e) => e.toJson()).toList(),
    };
