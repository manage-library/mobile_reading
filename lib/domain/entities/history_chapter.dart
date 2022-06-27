
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history_chapter.g.dart';

@JsonSerializable(explicitToJson: true)
class HistoryBook {
  String? createdAt;
  String? updatedAt;
  int? id;
  int? user_id;
  int? book_id;
  Book? book;
  Chapter? chapter;
  HistoryBook({this.createdAt, this.updatedAt, this.book_id, this.id, this.user_id, this.book, this.chapter});

  factory HistoryBook.fromJson(Map<String, dynamic> json) => _$HistoryBookFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryBookToJson(this);


}