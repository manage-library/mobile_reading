import 'package:book_reading_mobile_app/domain/entities/category.dart';

import 'package:json_annotation/json_annotation.dart';

part 'bookCategory.g.dart';

@JsonSerializable(explicitToJson: true)
class BookCategory {
  final int? category_id;
  final Category? category;
  BookCategory({this.category, this.category_id});

  factory BookCategory.fromJson(Map<String, dynamic> json) => _$BookCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$BookCategoryToJson(this);
}