import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../features/auth/controller/auth_cotroller.dart';
import '../../features/community/controller/community_controller.dart';
import '../../features/post/controller/post_controller.dart';
import '../../theme/pallete.dart';
import '../models/community.dart';
import '../models/post.dart';

class PostCard extends ConsumerWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

  void deleteAPost(BuildContext context, WidgetRef ref) {
    ref.read(postControllerProvider.notifier).deleteAPost(context, post);
  }

  void navToCommunity(BuildContext context) {
    Routemaster.of(context).push('r/${post.communityName}');
  }

  void navToUserProfile(BuildContext context) {
    Routemaster.of(context).push('/u/${post.uid}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          print(post.title);
        },
        child: Ink(
          decoration: BoxDecoration(
            color: theme.drawerTheme.backgroundColor,
            boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.3), offset: const Offset(0, 0), blurRadius: 0.1)],
          ),
          // padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildPostHeader(context, ref, theme),
                    const SizedBox(height: 8),
                    Text(post.title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 6),
                    buildContentBody(context, theme),
                  ],
                ),
              ),
              PostCardControlls(post: post),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContentBody(BuildContext context, ThemeData theme) {
    if (post.type == 'image') {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        child: Image.network(post.link!, fit: BoxFit.cover),
      );
    } else if (post.type == 'link') {
      return AnyLinkPreview(
        link: post.link ?? '',
        displayDirection: UIDirection.uiDirectionHorizontal,
        showMultimedia: false,
        bodyMaxLines: 5,
        bodyTextOverflow: TextOverflow.ellipsis,
        titleStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        bodyStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        errorBody: 'Could not fetch the data properly',
        errorTitle: 'Could not fetch the title',
        errorWidget: Text('No link preview', style: theme.textTheme.bodySmall),
        // errorImage: "https://google.com/",
        cache: const Duration(days: 7),
        removeElevation: false,
        boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
        // onTap: () {}, // This disables tap event
      );
    }

    return Text(post.description ?? '', style: theme.textTheme.bodySmall);
  }

  Row buildPostHeader(BuildContext context, WidgetRef ref, ThemeData theme) {
    final uid = ref.watch(signedInUserProvider)!.uid;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => navToCommunity(context),
          child: CircleAvatar(
            backgroundImage: NetworkImage(post.communityAvater),
            radius: 16,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => navToCommunity(context),
              child: Text('r/${post.communityName}', style: theme.textTheme.titleSmall),
            ),
            GestureDetector(
              onTap: () => navToUserProfile(context),
              child: Text('u/${post.userName}', style: theme.textTheme.bodySmall),
            ),
          ],
        ),
        const Spacer(),
        if (post.uid == uid)
          IconButton(
            onPressed: () => deleteAPost(context, ref),
            icon: const Icon(Icons.delete, size: 20),
            style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          )
      ],
    );
  }
}

class PostCardControlls extends ConsumerWidget {
  final Post post;
  const PostCardControlls({
    super.key,
    required this.post,
  });

  void downVote(BuildContext context, WidgetRef ref) {
    ref.read(postControllerProvider.notifier).downvoteAPost(post);
  }

  void upVote(BuildContext context, WidgetRef ref) {
    ref.read(postControllerProvider.notifier).upvoteAPost(post);
  }

  void deleteAPost(BuildContext context, WidgetRef ref) {
    ref.read(postControllerProvider.notifier).deleteAPost(context, post);
  }

  void showComments(BuildContext context, WidgetRef ref) {
    // ref.read(postControllerProvider.notifier).deleteAPost(context, post);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final uid = ref.read(signedInUserProvider)!.uid;

    Community? comminity;
    ref.watch(GetCommunityByNameProvider(post.communityName)).whenData((cm) => comminity = cm);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildVoteControlls(context, ref, uid, theme),
        TextButton.icon(
          onPressed: () => showComments(context, ref),
          icon: const Icon(Icons.mode_comment_outlined, size: 22),
          label: const Text('0'),
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.grey.shade400),
            foregroundColor: MaterialStatePropertyAll(Colors.grey.shade400),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.share_outlined, size: 22),
          label: const Text('Share'),
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.grey.shade400),
            foregroundColor: MaterialStatePropertyAll(Colors.grey.shade400),
          ),
        ),
        if (comminity?.mods.contains(uid) ?? false)
          IconButton(
            onPressed: () => deleteAPost(context, ref),
            icon: const Icon(Icons.admin_panel_settings, size: 24),
          ),
      ],
    );
  }

  Row buildVoteControlls(BuildContext context, WidgetRef ref, String uid, ThemeData theme) {
    final downVoteColor = Colors.indigo.shade200;
    final upVoteColor = Colors.orange.shade700;

    final voteCount = post.upvotes.length - post.downvotes.length;
    final hasUpVote = post.upvotes.contains(uid);
    final hasDownVote = post.downvotes.contains(uid);

    Color getTextColor() {
      return hasUpVote
          ? upVoteColor
          : hasDownVote
              ? downVoteColor
              : Colors.grey.shade400;
    }

    return Row(
      children: [
        IconButton(
          onPressed: () => upVote(context, ref),
          icon: const Icon(Icons.upload_outlined),
          isSelected: hasUpVote,
          selectedIcon: Icon(Icons.upload, color: upVoteColor),
        ),
        Text(
          voteCount == 0 ? 'Vote' : voteCount.toString(),
          style: theme.textTheme.titleSmall?.copyWith(color: getTextColor()),
        ),
        IconButton(
          onPressed: () => downVote(context, ref),
          icon: const Icon(Icons.download_outlined),
          isSelected: hasDownVote,
          selectedIcon: Icon(Icons.download, color: downVoteColor),
        ),
      ],
    );
  }
}
