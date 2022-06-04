import 'package:json_annotation/json_annotation.dart';
part 'author.g.dart';

@JsonSerializable(explicitToJson: true)
class Author {
  final int? id;
  final String? fullName;

  Author({this.id, this.fullName});
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}