// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @JsonKey(name: 'productId')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'productName')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'shopId')
  int? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'productImgURL')
  String? get productImgURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'productId') int? productId,
      @JsonKey(name: 'productName') String? productName,
      @JsonKey(name: 'shopId') int? shopId,
      @JsonKey(name: 'quantity') int? quantity,
      @JsonKey(name: 'price') int? price,
      @JsonKey(name: 'productImgURL') String? productImgURL});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? shopId = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? productImgURL = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      productImgURL: freezed == productImgURL
          ? _value.productImgURL
          : productImgURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'productId') int? productId,
      @JsonKey(name: 'productName') String? productName,
      @JsonKey(name: 'shopId') int? shopId,
      @JsonKey(name: 'quantity') int? quantity,
      @JsonKey(name: 'price') int? price,
      @JsonKey(name: 'productImgURL') String? productImgURL});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? shopId = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? productImgURL = freezed,
  }) {
    return _then(_$ProductModelImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      productImgURL: freezed == productImgURL
          ? _value.productImgURL
          : productImgURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {@JsonKey(name: 'productId') this.productId,
      @JsonKey(name: 'productName') this.productName,
      @JsonKey(name: 'shopId') this.shopId,
      @JsonKey(name: 'quantity') this.quantity,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'productImgURL') this.productImgURL});

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @JsonKey(name: 'productId')
  final int? productId;
  @override
  @JsonKey(name: 'productName')
  final String? productName;
  @override
  @JsonKey(name: 'shopId')
  final int? shopId;
  @override
  @JsonKey(name: 'quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'price')
  final int? price;
  @override
  @JsonKey(name: 'productImgURL')
  final String? productImgURL;

  @override
  String toString() {
    return 'ProductModel(productId: $productId, productName: $productName, shopId: $shopId, quantity: $quantity, price: $price, productImgURL: $productImgURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productImgURL, productImgURL) ||
                other.productImgURL == productImgURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, productName, shopId,
      quantity, price, productImgURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
          {@JsonKey(name: 'productId') final int? productId,
          @JsonKey(name: 'productName') final String? productName,
          @JsonKey(name: 'shopId') final int? shopId,
          @JsonKey(name: 'quantity') final int? quantity,
          @JsonKey(name: 'price') final int? price,
          @JsonKey(name: 'productImgURL') final String? productImgURL}) =
      _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @JsonKey(name: 'productId')
  int? get productId;
  @override
  @JsonKey(name: 'productName')
  String? get productName;
  @override
  @JsonKey(name: 'shopId')
  int? get shopId;
  @override
  @JsonKey(name: 'quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'price')
  int? get price;
  @override
  @JsonKey(name: 'productImgURL')
  String? get productImgURL;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
