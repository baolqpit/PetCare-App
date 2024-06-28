import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserModel({
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'userName') String? userName,
    @JsonKey(name: 'email') String? email
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
  _$UserModelFromJson(json);
}
