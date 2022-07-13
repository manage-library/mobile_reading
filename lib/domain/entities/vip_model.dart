
import 'package:json_annotation/json_annotation.dart';

part 'vip_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VipModel {
  String? vipId;
  bool? status;
  VipModel({this.status, this.vipId});

   factory VipModel.fromJson(Map<String, dynamic> json) => _$VipModelFromJson(json);

  Map<String, dynamic> toJson() => _$VipModelToJson(this);
}