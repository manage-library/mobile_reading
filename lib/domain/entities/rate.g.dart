// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRatingModel _$BookRatingModelFromJson(Map<String, dynamic> json) =>
    BookRatingModel(
      content: json['content'] as String?,
      comment: json['comment'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookRatingModelToJson(BookRatingModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'comment': instance.comment,
      'content': instance.content,
    };
