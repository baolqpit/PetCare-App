// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsDataModelImpl _$$NewsDataModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsDataModelImpl(
      listAttribute: (json['listAttributes'] as List<dynamic>?)
          ?.map((e) => AttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$NewsDataModelImplToJson(_$NewsDataModelImpl instance) =>
    <String, dynamic>{
      'listAttributes': instance.listAttribute?.map((e) => e.toJson()).toList(),
      'content': instance.content,
    };

_$AttributeModelImpl _$$AttributeModelImplFromJson(Map<String, dynamic> json) =>
    _$AttributeModelImpl(
      label: json['label'] as String?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$$AttributeModelImplToJson(
        _$AttributeModelImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'isSelected': instance.isSelected,
    };
