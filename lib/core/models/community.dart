import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';

part 'community.g.dart';

@freezed
class Community with _$Community {
  const factory Community({
    required String id,
    required String name,
    required String banner,
    required String avater,
    required List<String> members,
    required List<String> mods,
  }) = _Community;

  factory Community.fromJson(Map<String, Object?> json) => _$CommunityFromJson(json);
}
