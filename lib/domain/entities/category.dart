import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  final String? name;
  final int? id;
  bool? isSelected = false;

  Category({
    this.name,
    this.id
  });

  set selectedItem(bool? isSelected) {
      this.isSelected = isSelected;
  }

  bool get selectedItem {
      return isSelected ?? false;
   }


  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
