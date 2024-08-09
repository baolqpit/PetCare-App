// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      newsId: (json['newsId'] as num?)?.toInt(),
      newsTitle: json['newsTitle'] as String?,
      newsURL: json['newsURL'] as String?,
      newsTypeName: json['newsTypeName'] as String?,
      newsTypeId: (json['newsTypeId'] as num?)?.toInt(),
      publicDate: json['publicDate'] as String?,
      publicByShopId: (json['publicByShopId'] as num?)?.toInt(),
      newsData: json['newsData'] as String?,
      location: json['location'] as String?,
      abandonAnimalTypeId: (json['abandonAnimalTypeId'] as num?)?.toInt(),
      abandonAnimalTypeName: json['abandonAnimalTypeName'] as String?,
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'newsId': instance.newsId,
      'newsTitle': instance.newsTitle,
      'newsURL': instance.newsURL,
      'newsTypeName': instance.newsTypeName,
      'newsTypeId': instance.newsTypeId,
      'publicDate': instance.publicDate,
      'publicByShopId': instance.publicByShopId,
      'newsData': instance.newsData,
      'location': instance.location,
      'abandonAnimalTypeId': instance.abandonAnimalTypeId,
      'abandonAnimalTypeName': instance.abandonAnimalTypeName,
    };
