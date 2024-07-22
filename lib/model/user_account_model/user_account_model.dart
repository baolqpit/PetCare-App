import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_account_model.freezed.dart';
part 'user_account_model.g.dart';

@freezed
class UserAccountModel with _$UserAccountModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserAccountModel({
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
  }) = _UserAccountModel;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountModelFromJson(json);
}