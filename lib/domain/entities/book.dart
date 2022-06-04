import 'package:book_reading_mobile_app/domain/entities/author.dart';
import 'package:book_reading_mobile_app/domain/entities/bookCategory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final int? isVip;
  final String? releaseStatus;
  final Author? author;
  final List<BookCategory>? bookCategory;
  final int? isLike;
  final int? countChapter;
  final int? countLike;
  final int? countDownload;

  Book(
    this.bookCategory,
    this.isLike,
    this.countChapter,
    this.countLike,
    this.countDownload, {
    this.description,
    this.name,
    this.id,
    this.image,
    this.isVip,
    this.author,
    this.releaseStatus,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
