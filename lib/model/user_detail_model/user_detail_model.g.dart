// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailModelImpl _$$UserDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailModelImpl(
      userId: (json['userId'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      address: json['city'] as String?,
      phone: json['phone'] as String?,
      userRoleId: (json['use;rRoleId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserDetailModelImplToJson(
        _$UserDetailModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'city': instance.address,
      'phone': instance.phone,
      'use;rRoleId': instance.userRoleId,
    };
