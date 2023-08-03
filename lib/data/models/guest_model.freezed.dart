// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestModel _$GuestModelFromJson(Map<String, dynamic> json) {
  return _GuestModel.fromJson(json);
}

/// @nodoc
mixin _$GuestModel {
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get surname => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get birthday => throw _privateConstructorUsedError;
  @HiveField(4)
  String get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(5)
  String get profession => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestModelCopyWith<GuestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestModelCopyWith<$Res> {
  factory $GuestModelCopyWith(
          GuestModel value, $Res Function(GuestModel) then) =
      _$GuestModelCopyWithImpl<$Res, GuestModel>;
  @useResult
  $Res call(
      {@HiveField(1) String name,
      @HiveField(2) String surname,
      @HiveField(3) DateTime birthday,
      @HiveField(4) String phoneNumber,
      @HiveField(5) String profession});
}

/// @nodoc
class _$GuestModelCopyWithImpl<$Res, $Val extends GuestModel>
    implements $GuestModelCopyWith<$Res> {
  _$GuestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? surname = null,
    Object? birthday = null,
    Object? phoneNumber = null,
    Object? profession = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profession: null == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GuestModelCopyWith<$Res>
    implements $GuestModelCopyWith<$Res> {
  factory _$$_GuestModelCopyWith(
          _$_GuestModel value, $Res Function(_$_GuestModel) then) =
      __$$_GuestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String name,
      @HiveField(2) String surname,
      @HiveField(3) DateTime birthday,
      @HiveField(4) String phoneNumber,
      @HiveField(5) String profession});
}

/// @nodoc
class __$$_GuestModelCopyWithImpl<$Res>
    extends _$GuestModelCopyWithImpl<$Res, _$_GuestModel>
    implements _$$_GuestModelCopyWith<$Res> {
  __$$_GuestModelCopyWithImpl(
      _$_GuestModel _value, $Res Function(_$_GuestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? surname = null,
    Object? birthday = null,
    Object? phoneNumber = null,
    Object? profession = null,
  }) {
    return _then(_$_GuestModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profession: null == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$_GuestModel extends _GuestModel {
  _$_GuestModel(
      {@HiveField(1) required this.name,
      @HiveField(2) required this.surname,
      @HiveField(3) required this.birthday,
      @HiveField(4) required this.phoneNumber,
      @HiveField(5) required this.profession})
      : super._();

  factory _$_GuestModel.fromJson(Map<String, dynamic> json) =>
      _$$_GuestModelFromJson(json);

  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String surname;
  @override
  @HiveField(3)
  final DateTime birthday;
  @override
  @HiveField(4)
  final String phoneNumber;
  @override
  @HiveField(5)
  final String profession;

  @override
  String toString() {
    return 'GuestModel(name: $name, surname: $surname, birthday: $birthday, phoneNumber: $phoneNumber, profession: $profession)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuestModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profession, profession) ||
                other.profession == profession));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, surname, birthday, phoneNumber, profession);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GuestModelCopyWith<_$_GuestModel> get copyWith =>
      __$$_GuestModelCopyWithImpl<_$_GuestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestModelToJson(
      this,
    );
  }
}

abstract class _GuestModel extends GuestModel {
  factory _GuestModel(
      {@HiveField(1) required final String name,
      @HiveField(2) required final String surname,
      @HiveField(3) required final DateTime birthday,
      @HiveField(4) required final String phoneNumber,
      @HiveField(5) required final String profession}) = _$_GuestModel;
  _GuestModel._() : super._();

  factory _GuestModel.fromJson(Map<String, dynamic> json) =
      _$_GuestModel.fromJson;

  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get surname;
  @override
  @HiveField(3)
  DateTime get birthday;
  @override
  @HiveField(4)
  String get phoneNumber;
  @override
  @HiveField(5)
  String get profession;
  @override
  @JsonKey(ignore: true)
  _$$_GuestModelCopyWith<_$_GuestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
