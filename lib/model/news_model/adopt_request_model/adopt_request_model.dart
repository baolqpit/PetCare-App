import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcare_app_management/model/news_model/news_data_model/news_data_model.dart';

part 'adopt_request_model.freezed.dart';
part 'adopt_request_model.g.dart';

@freezed
class AdoptRequestModel with _$AdoptRequestModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AdoptRequestModel({
    @JsonKey(name: 'adoptRequestId') int? adoptRequestId,
    @JsonKey(name: 'sendByUserId') int? sendByUserId,
    @JsonKey(name: 'sendByUserName') String? sendByUserName,
    @JsonKey(name: 'sendDate') String? sendDate,
    @JsonKey(name: 'adoptRequestStatusId') int? adoptRequestStatusId,
    @JsonKey(name: 'adoptRequestStatusName') String? adoptRequestStatusName,
    @JsonKey(name: 'newsId') int? newsId,
  }) = _AdoptRequestModel;

  factory AdoptRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AdoptRequestModelFromJson(json);
}