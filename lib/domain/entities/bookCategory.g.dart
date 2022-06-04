// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCategory _$BookCategoryFromJson(Map<String, dynamic> json) => BookCategory(
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      category_id: json['category_id'] as int?,
    );

Map<String, dynamic> _$BookCategoryToJson(BookCategory instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'category': instance.category?.toJson(),
    };
