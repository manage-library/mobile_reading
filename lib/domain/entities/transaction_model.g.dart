// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      amount: json['amount'] as String?,
      code: json['code'] as String?,
      id: json['id'] as int?,
      status: json['status'] as int?,
      user_id: json['user_id'] as int?,
      vip_id: json['vip_id'] as int?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'vip_id': instance.vip_id,
      'amount': instance.amount,
      'code': instance.code,
      'status': instance.status,
      'id': instance.id,
    };
