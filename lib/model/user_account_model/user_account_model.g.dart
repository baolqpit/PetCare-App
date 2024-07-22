// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccountModelImpl _$$UserAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAccountModelImpl(
      userId: (json['userId'] as num?)?.toInt(),
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$UserAccountModelImplToJson(
        _$UserAccountModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'password': instance.password,
    };
