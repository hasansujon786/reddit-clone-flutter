import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/models/community.dart';
import '../../../core/models/user_model.dart';
import '../../auth/controller/auth_cotroller.dart';
import '../controller/community_controller.dart';

class CommunityScreen extends ConsumerWidget {
  final String name;
  const CommunityScreen({super.key, required this.name});

  void joinOrLeaveCommunity(BuildContext context, WidgetRef ref, Community community) {
    ref.read(communityControllerProvider.notifier).joinOrLeaveCommunity(community, context);
  }

  static const routeName = '/r/:name';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(signedInUserProvider)!;
    return ref.watch(getCommunityByNameProvider(name)).when(
          data: (commnity) {
            return Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => buildAppBarWithBanner(commnity, user, context),
                body: const Column(
                  children: [],
                ),
              ),
            );
          },
          error: rpErrorView,
          loading: rpLodingView,
        );
  }

  List<Widget> buildAppBarWithBanner(Community commnity, UserModel user, BuildContext context) {
    return [
      SliverAppBar(
        expandedHeight: 150,
        // floating: true,
        // snap: true,
        pinned: true,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(child: Image.network(commnity.banner, fit: BoxFit.cover)),
          ],
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(backgroundImage: NetworkImage(commnity.avater), radius: 35),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'r/${commnity.name}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  commnity.mods.contains(user.uid)
                      ? OutlinedButton(
                          onPressed: () {
                            Routemaster.of(context).push('/mod-tools/$name');
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                            minimumSize: const Size(40, 30),
                          ),
                          child: const Text(
                            'Mod Tools',
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      : Consumer(
                          builder: (context, ref, child) => OutlinedButton(
                            onPressed: () => joinOrLeaveCommunity(context, ref, commnity),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                              minimumSize: const Size(40, 30),
                            ),
                            child: Text(
                              commnity.members.contains(user.uid) ? 'Joined' : '  Join  ',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('${commnity.members.length} members'),
              )
            ],
          ),
        ),
      )
    ];
  }
}
