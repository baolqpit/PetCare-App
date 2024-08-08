// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetModelImpl _$$PetModelImplFromJson(Map<String, dynamic> json) =>
    _$PetModelImpl(
      petId: (json['petId'] as num?)?.toInt(),
      petName: json['petName'] as String?,
      petBirthday: json['petBirthday'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      petTypeId: (json['petTypeId'] as num?)?.toInt(),
      petTypeName: json['petTypeName'] as String?,
      petAge: (json['petAge'] as num?)?.toInt(),
      petImgURL: json['petImgURL'] as String?,
      petAlbumn: (json['petAlbumn'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PetModelImplToJson(_$PetModelImpl instance) =>
    <String, dynamic>{
      'petId': instance.petId,
      'petName': instance.petName,
      'petBirthday': instance.petBirthday,
      'userId': instance.userId,
      'petTypeId': instance.petTypeId,
      'petTypeName': instance.petTypeName,
      'petAge': instance.petAge,
      'petImgURL': instance.petImgURL,
      'petAlbumn': instance.petAlbumn,
    };
