import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_data_model.freezed.dart';
part 'news_data_model.g.dart';

@freezed
class NewsDataModel with _$NewsDataModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory NewsDataModel({
    @JsonKey(name: 'listAttributes') List<AttributeModel>? listAttribute,
    @JsonKey(name: 'content') String? content,
  }) = _NewsDataModel;

  factory NewsDataModel.fromJson(Map<String, dynamic> json) =>
      _$NewsDataModelFromJson(json);
}

@freezed
class AttributeModel with _$AttributeModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AttributeModel({
    @JsonKey(name: 'label') String? label,
    @JsonKey(name: 'isSelected') bool? isSelected,
  }) = _AttributeModel;

  factory AttributeModel.fromJson(Map<String, dynamic> json) =>
      _$AttributeModelFromJson(json);
}