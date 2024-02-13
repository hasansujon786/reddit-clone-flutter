import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/pallete.dart';
import '../models/post.dart';

class PostCard extends ConsumerWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

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
                    buildPostHeader(theme),
                    const SizedBox(height: 8),
                    Text(post.title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 6),
                    buildContentBody(context, theme),
                  ],
                ),
              ),
              const PostCardControlls()
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

  Row buildPostHeader(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(backgroundImage: NetworkImage(post.communityAvater), radius: 16),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('r/${post.communityName}', style: theme.textTheme.titleSmall),
            Text('u/${post.userName}', style: theme.textTheme.bodySmall),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, size: 20),
          style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        )
      ],
    );
  }
}

class PostCardControlls extends ConsumerWidget {
  const PostCardControlls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.upload_outlined)),
            Text('0', style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey.shade400)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.download_outlined)),
          ],
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.mode_comment_outlined, size: 22),
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.grey.shade400),
            foregroundColor: MaterialStatePropertyAll(Colors.grey.shade400),
          ),
          label: const Text('0'),
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
        IconButton(onPressed: () {}, icon: const Icon(Icons.card_giftcard, size: 22)),
      ],
    );
  }
}
