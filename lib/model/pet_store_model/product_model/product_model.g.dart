// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productId: (json['productId'] as num?)?.toInt(),
      productName: json['productName'] as String?,
      shopId: (json['shopId'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      productImgURL: json['productImgURL'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'shopId': instance.shopId,
      'quantity': instance.quantity,
      'price': instance.price,
      'productImgURL': instance.productImgURL,
    };
