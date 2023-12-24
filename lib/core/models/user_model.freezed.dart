// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get name => throw _privateConstructorUsedError;
  String get displayImage => throw _privateConstructorUsedError;
  String get banner => throw _privateConstructorUsedError;
  bool get isAuthinticated => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  int get karma => throw _privateConstructorUsedError;
  List<String> get awards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String name,
      String displayImage,
      String banner,
      bool isAuthinticated,
      String uid,
      int karma,
      List<String> awards});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? displayImage = null,
    Object? banner = null,
    Object? isAuthinticated = null,
    Object? uid = null,
    Object? karma = null,
    Object? awards = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayImage: null == displayImage
          ? _value.displayImage
          : displayImage // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthinticated: null == isAuthinticated
          ? _value.isAuthinticated
          : isAuthinticated // ignore: cast_nullable_to_non_nullable
              as bool,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      karma: null == karma
          ? _value.karma
          : karma // ignore: cast_nullable_to_non_nullable
              as int,
      awards: null == awards
          ? _value.awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String displayImage,
      String banner,
      bool isAuthinticated,
      String uid,
      int karma,
      List<String> awards});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? displayImage = null,
    Object? banner = null,
    Object? isAuthinticated = null,
    Object? uid = null,
    Object? karma = null,
    Object? awards = null,
  }) {
    return _then(_$UserModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayImage: null == displayImage
          ? _value.displayImage
          : displayImage // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthinticated: null == isAuthinticated
          ? _value.isAuthinticated
          : isAuthinticated // ignore: cast_nullable_to_non_nullable
              as bool,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      karma: null == karma
          ? _value.karma
          : karma // ignore: cast_nullable_to_non_nullable
              as int,
      awards: null == awards
          ? _value._awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.name,
      required this.displayImage,
      required this.banner,
      required this.isAuthinticated,
      required this.uid,
      required this.karma,
      required final List<String> awards})
      : _awards = awards;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String name;
  @override
  final String displayImage;
  @override
  final String banner;
  @override
  final bool isAuthinticated;
  @override
  final String uid;
  @override
  final int karma;
  final List<String> _awards;
  @override
  List<String> get awards {
    if (_awards is EqualUnmodifiableListView) return _awards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_awards);
  }

  @override
  String toString() {
    return 'UserModel(name: $name, displayImage: $displayImage, banner: $banner, isAuthinticated: $isAuthinticated, uid: $uid, karma: $karma, awards: $awards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayImage, displayImage) ||
                other.displayImage == displayImage) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.isAuthinticated, isAuthinticated) ||
                other.isAuthinticated == isAuthinticated) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.karma, karma) || other.karma == karma) &&
            const DeepCollectionEquality().equals(other._awards, _awards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      displayImage,
      banner,
      isAuthinticated,
      uid,
      karma,
      const DeepCollectionEquality().hash(_awards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String name,
      required final String displayImage,
      required final String banner,
      required final bool isAuthinticated,
      required final String uid,
      required final int karma,
      required final List<String> awards}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get name;
  @override
  String get displayImage;
  @override
  String get banner;
  @override
  bool get isAuthinticated;
  @override
  String get uid;
  @override
  int get karma;
  @override
  List<String> get awards;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
