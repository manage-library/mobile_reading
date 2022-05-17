import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  final String? name;
  final String? description;
  final String? releaseStatus;
  final String? censorshipStatus;
  final String? isVisible;
  final List<String>? categoryIds;

  Book({
    this.description,
    this.name,
    this.categoryIds,
    this.censorshipStatus,
    this.isVisible,
    this.releaseStatus,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
