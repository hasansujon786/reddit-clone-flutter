// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityImpl _$$CommunityImplFromJson(Map<String, dynamic> json) =>
    _$CommunityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      banner: json['banner'] as String,
      avater: json['avater'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      mods: (json['mods'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CommunityImplToJson(_$CommunityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'banner': instance.banner,
      'avater': instance.avater,
      'members': instance.members,
      'mods': instance.mods,
    };
