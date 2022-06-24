import 'package:book_reading_mobile_app/domain/entities/author.dart';
import 'package:book_reading_mobile_app/domain/entities/bookCategory.dart';
import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:book_reading_mobile_app/domain/entities/rate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final bool? is_vip;
  final int? release_status;
  final Author? author;
  final String? author_description;
  final List<BookCategory>? bookCategory;
  final int? isLike;
  final int? countChapter;
  final int? countLike;
  final int? countDownload;
  final BookRatingModel? rate;
  final List<Chapter>? chapters;

  Book({
    this.bookCategory,
    this.isLike,
    this.countChapter,
    this.countLike,
    this.countDownload,
    this.description,
    this.name,
    this.id,
    this.image,
    this.is_vip,
    this.author,
    this.rate,
    this.release_status,
    this.chapters,
    this.author_description,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
