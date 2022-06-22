import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable(explicitToJson: true)
class Chapter {
  final int? id;
  final String? name;
  final String? description;
  final String? content;

  Chapter({
    this.id,
    this.name = '',
    this.description = '',
    this.content = '',
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}
