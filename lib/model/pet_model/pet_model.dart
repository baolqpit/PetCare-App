import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_model.freezed.dart';
part 'pet_model.g.dart';

@freezed
class PetModel with _$PetModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PetModel({
    @JsonKey(name: 'petId') int? petId,
    @JsonKey(name: 'petName') String? petName,
    @JsonKey(name: 'petBirthday') String? petBirthday,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'petTypeId') int? petTypeId,
    @JsonKey(name: 'petTypeName') String? petTypeName,
    @JsonKey(name: 'petAge') int? petAge,
    @JsonKey(name: 'petImgURL') String? petImgURL,
    @JsonKey(name: 'petAlbumn') List<String>? petAlbumn,
  }) = _PetModel;

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);
}