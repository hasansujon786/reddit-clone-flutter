// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Community _$CommunityFromJson(Map<String, dynamic> json) {
  return _Community.fromJson(json);
}

/// @nodoc
mixin _$Community {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get banner => throw _privateConstructorUsedError;
  String get avater => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  List<String> get mods => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityCopyWith<Community> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityCopyWith<$Res> {
  factory $CommunityCopyWith(Community value, $Res Function(Community) then) =
      _$CommunityCopyWithImpl<$Res, Community>;
  @useResult
  $Res call(
      {String id,
      String name,
      String banner,
      String avater,
      List<String> members,
      List<String> mods});
}

/// @nodoc
class _$CommunityCopyWithImpl<$Res, $Val extends Community>
    implements $CommunityCopyWith<$Res> {
  _$CommunityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? banner = null,
    Object? avater = null,
    Object? members = null,
    Object? mods = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      avater: null == avater
          ? _value.avater
          : avater // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mods: null == mods
          ? _value.mods
          : mods // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityImplCopyWith<$Res>
    implements $CommunityCopyWith<$Res> {
  factory _$$CommunityImplCopyWith(
          _$CommunityImpl value, $Res Function(_$CommunityImpl) then) =
      __$$CommunityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String banner,
      String avater,
      List<String> members,
      List<String> mods});
}

/// @nodoc
class __$$CommunityImplCopyWithImpl<$Res>
    extends _$CommunityCopyWithImpl<$Res, _$CommunityImpl>
    implements _$$CommunityImplCopyWith<$Res> {
  __$$CommunityImplCopyWithImpl(
      _$CommunityImpl _value, $Res Function(_$CommunityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? banner = null,
    Object? avater = null,
    Object? members = null,
    Object? mods = null,
  }) {
    return _then(_$CommunityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      avater: null == avater
          ? _value.avater
          : avater // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mods: null == mods
          ? _value._mods
          : mods // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityImpl implements _Community {
  const _$CommunityImpl(
      {required this.id,
      required this.name,
      required this.banner,
      required this.avater,
      required final List<String> members,
      required final List<String> mods})
      : _members = members,
        _mods = mods;

  factory _$CommunityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String banner;
  @override
  final String avater;
  final List<String> _members;
  @override
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<String> _mods;
  @override
  List<String> get mods {
    if (_mods is EqualUnmodifiableListView) return _mods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mods);
  }

  @override
  String toString() {
    return 'Community(id: $id, name: $name, banner: $banner, avater: $avater, members: $members, mods: $mods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.avater, avater) || other.avater == avater) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._mods, _mods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      banner,
      avater,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_mods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityImplCopyWith<_$CommunityImpl> get copyWith =>
      __$$CommunityImplCopyWithImpl<_$CommunityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityImplToJson(
      this,
    );
  }
}

abstract class _Community implements Community {
  const factory _Community(
      {required final String id,
      required final String name,
      required final String banner,
      required final String avater,
      required final List<String> members,
      required final List<String> mods}) = _$CommunityImpl;

  factory _Community.fromJson(Map<String, dynamic> json) =
      _$CommunityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get banner;
  @override
  String get avater;
  @override
  List<String> get members;
  @override
  List<String> get mods;
  @override
  @JsonKey(ignore: true)
  _$$CommunityImplCopyWith<_$CommunityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
