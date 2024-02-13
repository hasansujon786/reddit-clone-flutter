import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/common/post_card.dart';
import '../../community/controller/community_controller.dart';
import '../../post/controller/post_controller.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userCommunitiesProvider).when(
          data: (communities) => ref.watch(userFeedProvider(communities)).when(
                data: (posts) {
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return PostCard(post: post);
                    },
                  );
                },
                error: rpErrorView,
                loading: rpLodingView,
              ),
          error: rpErrorView,
          loading: rpLodingView,
        );
  }
}
