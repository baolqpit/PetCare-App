import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

@freezed
class ShopModel with _$ShopModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ShopModel({
    @JsonKey(name: 'shopId') int? shopId,
    @JsonKey(name: 'shopName') String? shopName,
    @JsonKey(name: 'shopImgURL') String? shopImgURL,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'shopMail') String? shopMail,
    @JsonKey(name: 'shopServices') List<int>? shopServices,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
}