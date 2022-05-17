// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      description: json['description'] as String?,
      name: json['name'] as String?,
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      censorshipStatus: json['censorshipStatus'] as String?,
      isVisible: json['isVisible'] as String?,
      releaseStatus: json['releaseStatus'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'releaseStatus': instance.releaseStatus,
      'censorshipStatus': instance.censorshipStatus,
      'isVisible': instance.isVisible,
      'categoryIds': instance.categoryIds,
    };
