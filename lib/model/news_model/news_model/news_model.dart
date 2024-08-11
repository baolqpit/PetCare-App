import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcare_app_management/model/news_model/news_data_model/news_data_model.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory NewsModel({
    @JsonKey(name: 'newsId') int? newsId,
    @JsonKey(name: 'newsTitle') String? newsTitle,
    @JsonKey(name: 'newsURL') String? newsURL,
    @JsonKey(name: 'newsTypeName') String? newsTypeName,
    @JsonKey(name: 'newsTypeId') int? newsTypeId,
    @JsonKey(name: 'publicDate') String? publicDate,
    @JsonKey(name: 'publicByShopId') int? publicByShopId,
    @JsonKey(name: 'newsData', ) String? newsData,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'abandonAnimalTypeId') int? abandonAnimalTypeId,
    @JsonKey(name: 'abandonAnimalTypeName') String? abandonAnimalTypeName,


  }) = _NewsModel;

  static dynamic _newsDataFromJson(Map<String,dynamic>? json){
    if (json != null) {
      return NewsDataModel.fromJson(json);
    } else {
      return "";
    }
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}