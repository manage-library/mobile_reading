import 'package:json_annotation/json_annotation.dart';

part 'security.g.dart';

@JsonSerializable(explicitToJson: true)
class Security {
  final String? accessToken;
  Security({this.accessToken,});

  factory Security.fromJson(Map<String, dynamic> json) => _$SecurityFromJson(json);

  Map<String, dynamic> toJson() => _$SecurityToJson(this);

}