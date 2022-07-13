// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VipModel _$VipModelFromJson(Map<String, dynamic> json) => VipModel(
      status: json['status'] as bool?,
      vipId: json['vipId'] as String?,
    );

Map<String, dynamic> _$VipModelToJson(VipModel instance) => <String, dynamic>{
      'vipId': instance.vipId,
      'status': instance.status,
    };
