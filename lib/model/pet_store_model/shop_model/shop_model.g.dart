// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopModelImpl _$$ShopModelImplFromJson(Map<String, dynamic> json) =>
    _$ShopModelImpl(
      shopId: (json['shopId'] as num?)?.toInt(),
      shopName: json['shopName'] as String?,
      shopImgURL: json['shopImgURL'] as String?,
      city: json['city'] as String?,
      phone: json['phone'] as String?,
      shopMail: json['shopMail'] as String?,
      shopServices: (json['shopServices'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$ShopModelImplToJson(_$ShopModelImpl instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'shopName': instance.shopName,
      'shopImgURL': instance.shopImgURL,
      'city': instance.city,
      'phone': instance.phone,
      'shopMail': instance.shopMail,
      'shopServices': instance.shopServices,
    };
