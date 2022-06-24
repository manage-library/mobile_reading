import 'package:json_annotation/json_annotation.dart';
part 'rate.g.dart';

@JsonSerializable(explicitToJson: true)
class BookRatingModel {
  final double? value;
  final int? count;
  BookRatingModel({this.count, this.value});
    factory BookRatingModel.fromJson(Map<String, dynamic> json) => _$BookRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookRatingModelToJson(this);
}