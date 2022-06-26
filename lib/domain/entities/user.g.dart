// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      password: json['password'] as String?,
      full_name: json['full_name'] as String?,
      date_of_birth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      gender: json['gender'] as String? ?? UserGender.female,
      avatar: json['avatar'] as String?,
      vip_id: json['vip_id'] as int? ?? 0,
      id: json['id'] as int? ?? 0
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'full_name': instance.full_name,
      'date_of_birth': instance.date_of_birth?.toIso8601String(),
      'gender': instance.gender,
      'avatar': instance.avatar,
      'vip_id': instance.vip_id,
      'id' : instance.id
    };
