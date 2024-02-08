// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get upvotes => throw _privateConstructorUsedError;
  List<String> get downvotes => throw _privateConstructorUsedError;
  List<String> get awards => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError; // Community
  String get communityName => throw _privateConstructorUsedError;
  String get communityAvater => throw _privateConstructorUsedError; // User
  String get userName => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String title,
      String type,
      String? link,
      String? description,
      DateTime createdAt,
      List<String> upvotes,
      List<String> downvotes,
      List<String> awards,
      int commentCount,
      String communityName,
      String communityAvater,
      String userName,
      String uid});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? link = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? upvotes = null,
    Object? downvotes = null,
    Object? awards = null,
    Object? commentCount = null,
    Object? communityName = null,
    Object? communityAvater = null,
    Object? userName = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      upvotes: null == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      downvotes: null == downvotes
          ? _value.downvotes
          : downvotes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      awards: null == awards
          ? _value.awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      communityName: null == communityName
          ? _value.communityName
          : communityName // ignore: cast_nullable_to_non_nullable
              as String,
      communityAvater: null == communityAvater
          ? _value.communityAvater
          : communityAvater // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String type,
      String? link,
      String? description,
      DateTime createdAt,
      List<String> upvotes,
      List<String> downvotes,
      List<String> awards,
      int commentCount,
      String communityName,
      String communityAvater,
      String userName,
      String uid});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? link = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? upvotes = null,
    Object? downvotes = null,
    Object? awards = null,
    Object? commentCount = null,
    Object? communityName = null,
    Object? communityAvater = null,
    Object? userName = null,
    Object? uid = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      upvotes: null == upvotes
          ? _value._upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      downvotes: null == downvotes
          ? _value._downvotes
          : downvotes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      awards: null == awards
          ? _value._awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      communityName: null == communityName
          ? _value.communityName
          : communityName // ignore: cast_nullable_to_non_nullable
              as String,
      communityAvater: null == communityAvater
          ? _value.communityAvater
          : communityAvater // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.link,
      required this.description,
      required this.createdAt,
      required final List<String> upvotes,
      required final List<String> downvotes,
      required final List<String> awards,
      required this.commentCount,
      required this.communityName,
      required this.communityAvater,
      required this.userName,
      required this.uid})
      : _upvotes = upvotes,
        _downvotes = downvotes,
        _awards = awards;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  @override
  final String? link;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  final List<String> _upvotes;
  @override
  List<String> get upvotes {
    if (_upvotes is EqualUnmodifiableListView) return _upvotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upvotes);
  }

  final List<String> _downvotes;
  @override
  List<String> get downvotes {
    if (_downvotes is EqualUnmodifiableListView) return _downvotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downvotes);
  }

  final List<String> _awards;
  @override
  List<String> get awards {
    if (_awards is EqualUnmodifiableListView) return _awards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_awards);
  }

  @override
  final int commentCount;
// Community
  @override
  final String communityName;
  @override
  final String communityAvater;
// User
  @override
  final String userName;
  @override
  final String uid;

  @override
  String toString() {
    return 'Post(id: $id, title: $title, type: $type, link: $link, description: $description, createdAt: $createdAt, upvotes: $upvotes, downvotes: $downvotes, awards: $awards, commentCount: $commentCount, communityName: $communityName, communityAvater: $communityAvater, userName: $userName, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._upvotes, _upvotes) &&
            const DeepCollectionEquality()
                .equals(other._downvotes, _downvotes) &&
            const DeepCollectionEquality().equals(other._awards, _awards) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.communityName, communityName) ||
                other.communityName == communityName) &&
            (identical(other.communityAvater, communityAvater) ||
                other.communityAvater == communityAvater) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      link,
      description,
      createdAt,
      const DeepCollectionEquality().hash(_upvotes),
      const DeepCollectionEquality().hash(_downvotes),
      const DeepCollectionEquality().hash(_awards),
      commentCount,
      communityName,
      communityAvater,
      userName,
      uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String id,
      required final String title,
      required final String type,
      required final String? link,
      required final String? description,
      required final DateTime createdAt,
      required final List<String> upvotes,
      required final List<String> downvotes,
      required final List<String> awards,
      required final int commentCount,
      required final String communityName,
      required final String communityAvater,
      required final String userName,
      required final String uid}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get type;
  @override
  String? get link;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  List<String> get upvotes;
  @override
  List<String> get downvotes;
  @override
  List<String> get awards;
  @override
  int get commentCount;
  @override // Community
  String get communityName;
  @override
  String get communityAvater;
  @override // User
  String get userName;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
