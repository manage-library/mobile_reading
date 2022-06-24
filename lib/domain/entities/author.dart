import 'package:json_annotation/json_annotation.dart';
part 'author.g.dart';

@JsonSerializable(explicitToJson: true)
class Author {
  final int? id;
  final String? full_name;

  Author({this.id, this.full_name});
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
