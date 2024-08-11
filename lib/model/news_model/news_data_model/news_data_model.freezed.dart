// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsDataModel _$NewsDataModelFromJson(Map<String, dynamic> json) {
  return _NewsDataModel.fromJson(json);
}

/// @nodoc
mixin _$NewsDataModel {
  @JsonKey(name: 'listAttributes')
  List<AttributeModel>? get listAttribute => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsDataModelCopyWith<NewsDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDataModelCopyWith<$Res> {
  factory $NewsDataModelCopyWith(
          NewsDataModel value, $Res Function(NewsDataModel) then) =
      _$NewsDataModelCopyWithImpl<$Res, NewsDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'listAttributes') List<AttributeModel>? listAttribute,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class _$NewsDataModelCopyWithImpl<$Res, $Val extends NewsDataModel>
    implements $NewsDataModelCopyWith<$Res> {
  _$NewsDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listAttribute = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      listAttribute: freezed == listAttribute
          ? _value.listAttribute
          : listAttribute // ignore: cast_nullable_to_non_nullable
              as List<AttributeModel>?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsDataModelImplCopyWith<$Res>
    implements $NewsDataModelCopyWith<$Res> {
  factory _$$NewsDataModelImplCopyWith(
          _$NewsDataModelImpl value, $Res Function(_$NewsDataModelImpl) then) =
      __$$NewsDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'listAttributes') List<AttributeModel>? listAttribute,
      @JsonKey(name: 'content') String? content});
}

/// @nodoc
class __$$NewsDataModelImplCopyWithImpl<$Res>
    extends _$NewsDataModelCopyWithImpl<$Res, _$NewsDataModelImpl>
    implements _$$NewsDataModelImplCopyWith<$Res> {
  __$$NewsDataModelImplCopyWithImpl(
      _$NewsDataModelImpl _value, $Res Function(_$NewsDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listAttribute = freezed,
    Object? content = freezed,
  }) {
    return _then(_$NewsDataModelImpl(
      listAttribute: freezed == listAttribute
          ? _value._listAttribute
          : listAttribute // ignore: cast_nullable_to_non_nullable
              as List<AttributeModel>?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$NewsDataModelImpl implements _NewsDataModel {
  const _$NewsDataModelImpl(
      {@JsonKey(name: 'listAttributes')
      final List<AttributeModel>? listAttribute,
      @JsonKey(name: 'content') this.content})
      : _listAttribute = listAttribute;

  factory _$NewsDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsDataModelImplFromJson(json);

  final List<AttributeModel>? _listAttribute;
  @override
  @JsonKey(name: 'listAttributes')
  List<AttributeModel>? get listAttribute {
    final value = _listAttribute;
    if (value == null) return null;
    if (_listAttribute is EqualUnmodifiableListView) return _listAttribute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'content')
  final String? content;

  @override
  String toString() {
    return 'NewsDataModel(listAttribute: $listAttribute, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDataModelImpl &&
            const DeepCollectionEquality()
                .equals(other._listAttribute, _listAttribute) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_listAttribute), content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDataModelImplCopyWith<_$NewsDataModelImpl> get copyWith =>
      __$$NewsDataModelImplCopyWithImpl<_$NewsDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsDataModelImplToJson(
      this,
    );
  }
}

abstract class _NewsDataModel implements NewsDataModel {
  const factory _NewsDataModel(
      {@JsonKey(name: 'listAttributes')
      final List<AttributeModel>? listAttribute,
      @JsonKey(name: 'content') final String? content}) = _$NewsDataModelImpl;

  factory _NewsDataModel.fromJson(Map<String, dynamic> json) =
      _$NewsDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'listAttributes')
  List<AttributeModel>? get listAttribute;
  @override
  @JsonKey(name: 'content')
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$NewsDataModelImplCopyWith<_$NewsDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttributeModel _$AttributeModelFromJson(Map<String, dynamic> json) {
  return _AttributeModel.fromJson(json);
}

/// @nodoc
mixin _$AttributeModel {
  @JsonKey(name: 'label')
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSelected')
  bool? get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributeModelCopyWith<AttributeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeModelCopyWith<$Res> {
  factory $AttributeModelCopyWith(
          AttributeModel value, $Res Function(AttributeModel) then) =
      _$AttributeModelCopyWithImpl<$Res, AttributeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'label') String? label,
      @JsonKey(name: 'isSelected') bool? isSelected});
}

/// @nodoc
class _$AttributeModelCopyWithImpl<$Res, $Val extends AttributeModel>
    implements $AttributeModelCopyWith<$Res> {
  _$AttributeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttributeModelImplCopyWith<$Res>
    implements $AttributeModelCopyWith<$Res> {
  factory _$$AttributeModelImplCopyWith(_$AttributeModelImpl value,
          $Res Function(_$AttributeModelImpl) then) =
      __$$AttributeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'label') String? label,
      @JsonKey(name: 'isSelected') bool? isSelected});
}

/// @nodoc
class __$$AttributeModelImplCopyWithImpl<$Res>
    extends _$AttributeModelCopyWithImpl<$Res, _$AttributeModelImpl>
    implements _$$AttributeModelImplCopyWith<$Res> {
  __$$AttributeModelImplCopyWithImpl(
      _$AttributeModelImpl _value, $Res Function(_$AttributeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$AttributeModelImpl(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$AttributeModelImpl implements _AttributeModel {
  const _$AttributeModelImpl(
      {@JsonKey(name: 'label') this.label,
      @JsonKey(name: 'isSelected') this.isSelected});

  factory _$AttributeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributeModelImplFromJson(json);

  @override
  @JsonKey(name: 'label')
  final String? label;
  @override
  @JsonKey(name: 'isSelected')
  final bool? isSelected;

  @override
  String toString() {
    return 'AttributeModel(label: $label, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributeModelImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributeModelImplCopyWith<_$AttributeModelImpl> get copyWith =>
      __$$AttributeModelImplCopyWithImpl<_$AttributeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributeModelImplToJson(
      this,
    );
  }
}

abstract class _AttributeModel implements AttributeModel {
  const factory _AttributeModel(
          {@JsonKey(name: 'label') final String? label,
          @JsonKey(name: 'isSelected') final bool? isSelected}) =
      _$AttributeModelImpl;

  factory _AttributeModel.fromJson(Map<String, dynamic> json) =
      _$AttributeModelImpl.fromJson;

  @override
  @JsonKey(name: 'label')
  String? get label;
  @override
  @JsonKey(name: 'isSelected')
  bool? get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$AttributeModelImplCopyWith<_$AttributeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
