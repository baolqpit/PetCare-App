// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return _PetModel.fromJson(json);
}

/// @nodoc
mixin _$PetModel {
  @JsonKey(name: 'petId')
  int? get petId => throw _privateConstructorUsedError;
  @JsonKey(name: 'petName')
  String? get petName => throw _privateConstructorUsedError;
  @JsonKey(name: 'petBirthday')
  String? get petBirthday => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'petTypeId')
  int? get petTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'petTypeName')
  String? get petTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'petAge')
  int? get petAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'petImgURL')
  String? get petImgURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'petAlbumn')
  List<String>? get petAlbumn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetModelCopyWith<PetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetModelCopyWith<$Res> {
  factory $PetModelCopyWith(PetModel value, $Res Function(PetModel) then) =
      _$PetModelCopyWithImpl<$Res, PetModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'petId') int? petId,
      @JsonKey(name: 'petName') String? petName,
      @JsonKey(name: 'petBirthday') String? petBirthday,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'petTypeId') int? petTypeId,
      @JsonKey(name: 'petTypeName') String? petTypeName,
      @JsonKey(name: 'petAge') int? petAge,
      @JsonKey(name: 'petImgURL') String? petImgURL,
      @JsonKey(name: 'petAlbumn') List<String>? petAlbumn});
}

/// @nodoc
class _$PetModelCopyWithImpl<$Res, $Val extends PetModel>
    implements $PetModelCopyWith<$Res> {
  _$PetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? petId = freezed,
    Object? petName = freezed,
    Object? petBirthday = freezed,
    Object? userId = freezed,
    Object? petTypeId = freezed,
    Object? petTypeName = freezed,
    Object? petAge = freezed,
    Object? petImgURL = freezed,
    Object? petAlbumn = freezed,
  }) {
    return _then(_value.copyWith(
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int?,
      petName: freezed == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String?,
      petBirthday: freezed == petBirthday
          ? _value.petBirthday
          : petBirthday // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      petTypeId: freezed == petTypeId
          ? _value.petTypeId
          : petTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      petTypeName: freezed == petTypeName
          ? _value.petTypeName
          : petTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      petAge: freezed == petAge
          ? _value.petAge
          : petAge // ignore: cast_nullable_to_non_nullable
              as int?,
      petImgURL: freezed == petImgURL
          ? _value.petImgURL
          : petImgURL // ignore: cast_nullable_to_non_nullable
              as String?,
      petAlbumn: freezed == petAlbumn
          ? _value.petAlbumn
          : petAlbumn // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetModelImplCopyWith<$Res>
    implements $PetModelCopyWith<$Res> {
  factory _$$PetModelImplCopyWith(
          _$PetModelImpl value, $Res Function(_$PetModelImpl) then) =
      __$$PetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'petId') int? petId,
      @JsonKey(name: 'petName') String? petName,
      @JsonKey(name: 'petBirthday') String? petBirthday,
      @JsonKey(name: 'userId') int? userId,
      @JsonKey(name: 'petTypeId') int? petTypeId,
      @JsonKey(name: 'petTypeName') String? petTypeName,
      @JsonKey(name: 'petAge') int? petAge,
      @JsonKey(name: 'petImgURL') String? petImgURL,
      @JsonKey(name: 'petAlbumn') List<String>? petAlbumn});
}

/// @nodoc
class __$$PetModelImplCopyWithImpl<$Res>
    extends _$PetModelCopyWithImpl<$Res, _$PetModelImpl>
    implements _$$PetModelImplCopyWith<$Res> {
  __$$PetModelImplCopyWithImpl(
      _$PetModelImpl _value, $Res Function(_$PetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? petId = freezed,
    Object? petName = freezed,
    Object? petBirthday = freezed,
    Object? userId = freezed,
    Object? petTypeId = freezed,
    Object? petTypeName = freezed,
    Object? petAge = freezed,
    Object? petImgURL = freezed,
    Object? petAlbumn = freezed,
  }) {
    return _then(_$PetModelImpl(
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as int?,
      petName: freezed == petName
          ? _value.petName
          : petName // ignore: cast_nullable_to_non_nullable
              as String?,
      petBirthday: freezed == petBirthday
          ? _value.petBirthday
          : petBirthday // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      petTypeId: freezed == petTypeId
          ? _value.petTypeId
          : petTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      petTypeName: freezed == petTypeName
          ? _value.petTypeName
          : petTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      petAge: freezed == petAge
          ? _value.petAge
          : petAge // ignore: cast_nullable_to_non_nullable
              as int?,
      petImgURL: freezed == petImgURL
          ? _value.petImgURL
          : petImgURL // ignore: cast_nullable_to_non_nullable
              as String?,
      petAlbumn: freezed == petAlbumn
          ? _value._petAlbumn
          : petAlbumn // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$PetModelImpl implements _PetModel {
  const _$PetModelImpl(
      {@JsonKey(name: 'petId') this.petId,
      @JsonKey(name: 'petName') this.petName,
      @JsonKey(name: 'petBirthday') this.petBirthday,
      @JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'petTypeId') this.petTypeId,
      @JsonKey(name: 'petTypeName') this.petTypeName,
      @JsonKey(name: 'petAge') this.petAge,
      @JsonKey(name: 'petImgURL') this.petImgURL,
      @JsonKey(name: 'petAlbumn') final List<String>? petAlbumn})
      : _petAlbumn = petAlbumn;

  factory _$PetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetModelImplFromJson(json);

  @override
  @JsonKey(name: 'petId')
  final int? petId;
  @override
  @JsonKey(name: 'petName')
  final String? petName;
  @override
  @JsonKey(name: 'petBirthday')
  final String? petBirthday;
  @override
  @JsonKey(name: 'userId')
  final int? userId;
  @override
  @JsonKey(name: 'petTypeId')
  final int? petTypeId;
  @override
  @JsonKey(name: 'petTypeName')
  final String? petTypeName;
  @override
  @JsonKey(name: 'petAge')
  final int? petAge;
  @override
  @JsonKey(name: 'petImgURL')
  final String? petImgURL;
  final List<String>? _petAlbumn;
  @override
  @JsonKey(name: 'petAlbumn')
  List<String>? get petAlbumn {
    final value = _petAlbumn;
    if (value == null) return null;
    if (_petAlbumn is EqualUnmodifiableListView) return _petAlbumn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PetModel(petId: $petId, petName: $petName, petBirthday: $petBirthday, userId: $userId, petTypeId: $petTypeId, petTypeName: $petTypeName, petAge: $petAge, petImgURL: $petImgURL, petAlbumn: $petAlbumn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetModelImpl &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.petName, petName) || other.petName == petName) &&
            (identical(other.petBirthday, petBirthday) ||
                other.petBirthday == petBirthday) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.petTypeId, petTypeId) ||
                other.petTypeId == petTypeId) &&
            (identical(other.petTypeName, petTypeName) ||
                other.petTypeName == petTypeName) &&
            (identical(other.petAge, petAge) || other.petAge == petAge) &&
            (identical(other.petImgURL, petImgURL) ||
                other.petImgURL == petImgURL) &&
            const DeepCollectionEquality()
                .equals(other._petAlbumn, _petAlbumn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      petId,
      petName,
      petBirthday,
      userId,
      petTypeId,
      petTypeName,
      petAge,
      petImgURL,
      const DeepCollectionEquality().hash(_petAlbumn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetModelImplCopyWith<_$PetModelImpl> get copyWith =>
      __$$PetModelImplCopyWithImpl<_$PetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetModelImplToJson(
      this,
    );
  }
}

abstract class _PetModel implements PetModel {
  const factory _PetModel(
          {@JsonKey(name: 'petId') final int? petId,
          @JsonKey(name: 'petName') final String? petName,
          @JsonKey(name: 'petBirthday') final String? petBirthday,
          @JsonKey(name: 'userId') final int? userId,
          @JsonKey(name: 'petTypeId') final int? petTypeId,
          @JsonKey(name: 'petTypeName') final String? petTypeName,
          @JsonKey(name: 'petAge') final int? petAge,
          @JsonKey(name: 'petImgURL') final String? petImgURL,
          @JsonKey(name: 'petAlbumn') final List<String>? petAlbumn}) =
      _$PetModelImpl;

  factory _PetModel.fromJson(Map<String, dynamic> json) =
      _$PetModelImpl.fromJson;

  @override
  @JsonKey(name: 'petId')
  int? get petId;
  @override
  @JsonKey(name: 'petName')
  String? get petName;
  @override
  @JsonKey(name: 'petBirthday')
  String? get petBirthday;
  @override
  @JsonKey(name: 'userId')
  int? get userId;
  @override
  @JsonKey(name: 'petTypeId')
  int? get petTypeId;
  @override
  @JsonKey(name: 'petTypeName')
  String? get petTypeName;
  @override
  @JsonKey(name: 'petAge')
  int? get petAge;
  @override
  @JsonKey(name: 'petImgURL')
  String? get petImgURL;
  @override
  @JsonKey(name: 'petAlbumn')
  List<String>? get petAlbumn;
  @override
  @JsonKey(ignore: true)
  _$$PetModelImplCopyWith<_$PetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
