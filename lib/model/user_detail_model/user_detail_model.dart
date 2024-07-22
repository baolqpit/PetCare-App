import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_model.freezed.dart';
part 'user_detail_model.g.dart';

@freezed
class UserDetailModel with _$UserDetailModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserDetailModel({
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'lastName') String? lastName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'city') String? address,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'use;rRoleId') int? userRoleId,
  }) = _UserDetailModel;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);
}