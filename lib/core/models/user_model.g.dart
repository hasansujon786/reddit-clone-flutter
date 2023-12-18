// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) => _$UserModelImpl(
      name: json['name'] as String,
      displayImage: json['displayImage'] as String,
      banner: json['banner'] as String,
      isAuthinticated: json['isAuthinticated'] as bool,
      uid: json['uid'] as String,
      karma: json['karma'] as int,
      awards: (json['awards'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) => <String, dynamic>{
      'name': instance.name,
      'displayImage': instance.displayImage,
      'banner': instance.banner,
      'isAuthinticated': instance.isAuthinticated,
      'uid': instance.uid,
      'karma': instance.karma,
      'awards': instance.awards,
    };
