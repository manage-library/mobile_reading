// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String?,
      id: json['id'] as int?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'isSelected': instance.isSelected,
    };
