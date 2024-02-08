// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      link: json['link'] as String?,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      upvotes:
          (json['upvotes'] as List<dynamic>).map((e) => e as String).toList(),
      downvotes:
          (json['downvotes'] as List<dynamic>).map((e) => e as String).toList(),
      awards:
          (json['awards'] as List<dynamic>).map((e) => e as String).toList(),
      commentCount: json['commentCount'] as int,
      communityName: json['communityName'] as String,
      communityAvater: json['communityAvater'] as String,
      userName: json['userName'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'link': instance.link,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
      'awards': instance.awards,
      'commentCount': instance.commentCount,
      'communityName': instance.communityName,
      'communityAvater': instance.communityAvater,
      'userName': instance.userName,
      'uid': instance.uid,
    };
