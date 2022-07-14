import 'package:book_reading_mobile_app/domain/entities/author.dart';
import 'package:book_reading_mobile_app/domain/entities/bookCategory.dart';
import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:book_reading_mobile_app/domain/entities/rate.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../style/app_colors.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  int? id;
  String? name;
  String? description;
  String? image;
  bool? is_vip;
  int? release_status;
  Author? author;
  String? author_description;
  List<BookCategory>? bookCategory;
  int? isLike;
  int? countChapter;
  int? countLike;
  int? countDownload;
  BookRatingModel? rate;
  List<Chapter>? chapters;

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

  bool get isFavourite => isLike == 1;

  void unsetFavourite() {
    isLike = 0;
    countLike = countLike == 0 ? 0 : (countLike ?? 0) - 1;
  }

  void setFavourite() {
    isLike = 1;
    countLike = (countLike ?? 0) + 1;
  }

  void toggleFavourite() {
    if (isFavourite) {
      unsetFavourite();
    } else {
      setFavourite();
    }
  }

  Color get imgFavoriteColor => isFavourite ? AppColors.darkGreyColor : AppColors.redColor;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
