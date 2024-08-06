import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ProductModel({
    @JsonKey(name: 'productId') int? productId,
    @JsonKey(name: 'productName') String? productName,
    @JsonKey(name: 'shopId') int? shopId,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'price') int? price,
    @JsonKey(name: 'productTypeId') int? productTypeId,
    @JsonKey(name: 'productTypeName') String? productTypeName,
    @JsonKey(name: 'productImgURL') String? productImgURL,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}