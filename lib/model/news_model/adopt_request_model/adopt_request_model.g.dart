// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopt_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdoptRequestModelImpl _$$AdoptRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdoptRequestModelImpl(
      adoptRequestId: (json['adoptRequestId'] as num?)?.toInt(),
      sendByUserId: (json['sendByUserId'] as num?)?.toInt(),
      sendByUserName: json['sendByUserName'] as String?,
      sendDate: json['sendDate'] as String?,
      adoptRequestStatusId: (json['adoptRequestStatusId'] as num?)?.toInt(),
      adoptRequestStatusName: json['adoptRequestStatusName'] as String?,
      newsId: (json['newsId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AdoptRequestModelImplToJson(
        _$AdoptRequestModelImpl instance) =>
    <String, dynamic>{
      'adoptRequestId': instance.adoptRequestId,
      'sendByUserId': instance.sendByUserId,
      'sendByUserName': instance.sendByUserName,
      'sendDate': instance.sendDate,
      'adoptRequestStatusId': instance.adoptRequestStatusId,
      'adoptRequestStatusName': instance.adoptRequestStatusName,
      'newsId': instance.newsId,
    };
