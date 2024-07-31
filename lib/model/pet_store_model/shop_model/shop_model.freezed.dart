// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) {
  return _ShopModel.fromJson(json);
}

/// @nodoc
mixin _$ShopModel {
  @JsonKey(name: 'shopId')
  int? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'shopName')
  String? get shopName => throw _privateConstructorUsedError;
  @JsonKey(name: 'shopImgURL')
  String? get shopImgURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'shopMail')
  String? get shopMail => throw _privateConstructorUsedError;
  @JsonKey(name: 'shopServices')
  List<int>? get shopServices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopModelCopyWith<ShopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopModelCopyWith<$Res> {
  factory $ShopModelCopyWith(ShopModel value, $Res Function(ShopModel) then) =
      _$ShopModelCopyWithImpl<$Res, ShopModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'shopId') int? shopId,
      @JsonKey(name: 'shopName') String? shopName,
      @JsonKey(name: 'shopImgURL') String? shopImgURL,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'shopMail') String? shopMail,
      @JsonKey(name: 'shopServices') List<int>? shopServices});
}

/// @nodoc
class _$ShopModelCopyWithImpl<$Res, $Val extends ShopModel>
    implements $ShopModelCopyWith<$Res> {
  _$ShopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = freezed,
    Object? shopName = freezed,
    Object? shopImgURL = freezed,
    Object? city = freezed,
    Object? phone = freezed,
    Object? shopMail = freezed,
    Object? shopServices = freezed,
  }) {
    return _then(_value.copyWith(
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      shopImgURL: freezed == shopImgURL
          ? _value.shopImgURL
          : shopImgURL // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      shopMail: freezed == shopMail
          ? _value.shopMail
          : shopMail // ignore: cast_nullable_to_non_nullable
              as String?,
      shopServices: freezed == shopServices
          ? _value.shopServices
          : shopServices // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopModelImplCopyWith<$Res>
    implements $ShopModelCopyWith<$Res> {
  factory _$$ShopModelImplCopyWith(
          _$ShopModelImpl value, $Res Function(_$ShopModelImpl) then) =
      __$$ShopModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'shopId') int? shopId,
      @JsonKey(name: 'shopName') String? shopName,
      @JsonKey(name: 'shopImgURL') String? shopImgURL,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'shopMail') String? shopMail,
      @JsonKey(name: 'shopServices') List<int>? shopServices});
}

/// @nodoc
class __$$ShopModelImplCopyWithImpl<$Res>
    extends _$ShopModelCopyWithImpl<$Res, _$ShopModelImpl>
    implements _$$ShopModelImplCopyWith<$Res> {
  __$$ShopModelImplCopyWithImpl(
      _$ShopModelImpl _value, $Res Function(_$ShopModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopId = freezed,
    Object? shopName = freezed,
    Object? shopImgURL = freezed,
    Object? city = freezed,
    Object? phone = freezed,
    Object? shopMail = freezed,
    Object? shopServices = freezed,
  }) {
    return _then(_$ShopModelImpl(
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      shopImgURL: freezed == shopImgURL
          ? _value.shopImgURL
          : shopImgURL // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      shopMail: freezed == shopMail
          ? _value.shopMail
          : shopMail // ignore: cast_nullable_to_non_nullable
              as String?,
      shopServices: freezed == shopServices
          ? _value._shopServices
          : shopServices // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$ShopModelImpl implements _ShopModel {
  const _$ShopModelImpl(
      {@JsonKey(name: 'shopId') this.shopId,
      @JsonKey(name: 'shopName') this.shopName,
      @JsonKey(name: 'shopImgURL') this.shopImgURL,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'shopMail') this.shopMail,
      @JsonKey(name: 'shopServices') final List<int>? shopServices})
      : _shopServices = shopServices;

  factory _$ShopModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopModelImplFromJson(json);

  @override
  @JsonKey(name: 'shopId')
  final int? shopId;
  @override
  @JsonKey(name: 'shopName')
  final String? shopName;
  @override
  @JsonKey(name: 'shopImgURL')
  final String? shopImgURL;
  @override
  @JsonKey(name: 'city')
  final String? city;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'shopMail')
  final String? shopMail;
  final List<int>? _shopServices;
  @override
  @JsonKey(name: 'shopServices')
  List<int>? get shopServices {
    final value = _shopServices;
    if (value == null) return null;
    if (_shopServices is EqualUnmodifiableListView) return _shopServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ShopModel(shopId: $shopId, shopName: $shopName, shopImgURL: $shopImgURL, city: $city, phone: $phone, shopMail: $shopMail, shopServices: $shopServices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopModelImpl &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopImgURL, shopImgURL) ||
                other.shopImgURL == shopImgURL) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.shopMail, shopMail) ||
                other.shopMail == shopMail) &&
            const DeepCollectionEquality()
                .equals(other._shopServices, _shopServices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      shopId,
      shopName,
      shopImgURL,
      city,
      phone,
      shopMail,
      const DeepCollectionEquality().hash(_shopServices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopModelImplCopyWith<_$ShopModelImpl> get copyWith =>
      __$$ShopModelImplCopyWithImpl<_$ShopModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopModelImplToJson(
      this,
    );
  }
}

abstract class _ShopModel implements ShopModel {
  const factory _ShopModel(
          {@JsonKey(name: 'shopId') final int? shopId,
          @JsonKey(name: 'shopName') final String? shopName,
          @JsonKey(name: 'shopImgURL') final String? shopImgURL,
          @JsonKey(name: 'city') final String? city,
          @JsonKey(name: 'phone') final String? phone,
          @JsonKey(name: 'shopMail') final String? shopMail,
          @JsonKey(name: 'shopServices') final List<int>? shopServices}) =
      _$ShopModelImpl;

  factory _ShopModel.fromJson(Map<String, dynamic> json) =
      _$ShopModelImpl.fromJson;

  @override
  @JsonKey(name: 'shopId')
  int? get shopId;
  @override
  @JsonKey(name: 'shopName')
  String? get shopName;
  @override
  @JsonKey(name: 'shopImgURL')
  String? get shopImgURL;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'shopMail')
  String? get shopMail;
  @override
  @JsonKey(name: 'shopServices')
  List<int>? get shopServices;
  @override
  @JsonKey(ignore: true)
  _$$ShopModelImplCopyWith<_$ShopModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
