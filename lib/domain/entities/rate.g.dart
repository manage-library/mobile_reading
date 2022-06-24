// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRatingModel _$BookRatingModelFromJson(Map<String, dynamic> json) =>
    BookRatingModel(
      count: json['count'] as int?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookRatingModelToJson(BookRatingModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'count': instance.count,
    };
