import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String? email;
  final String? password;
  final String? fullName;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? avatar;
  final int? vip_id;

  User({
    this.email,
    this.password,
    this.fullName,
    this.dateOfBirth,
    this.gender = UserGender.female,
    this.avatar,
    this.vip_id = 0,
  });

  static final User fakeUser = User(
    email: "test@gmail.com",
    password: "123456",
    gender: UserGender.female,
  );

  User copyWith({
    String? email,
    String? password,
    String? gender,
    String? fullName,
    DateTime? dateOfBirth,
    String? avatar,
    int? vip_id,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      avatar: avatar ?? this.avatar,
      vip_id: vip_id ?? this.vip_id
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}

class UserGender {
  static const String male = '1';
  static const String female = '2';
  static const String other = '3';
}
