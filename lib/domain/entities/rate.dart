import 'package:json_annotation/json_annotation.dart';
part 'rate.g.dart';

@JsonSerializable(explicitToJson: true)
class BookRatingModel {
  final double? rate;
  final String? comment;
  final String? content;
  BookRatingModel({this.content, this.comment, this.rate});
  factory BookRatingModel.fromJson(Map<String, dynamic> json) => _$BookRatingModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookRatingModelToJson(this);
}