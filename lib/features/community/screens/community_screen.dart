import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/loader.dart';
import '../../../core/common/error_text.dart';
import '../../auth/controller/auth_cotroller.dart';
import '../controller/community_controller.dart';

class CommunityScreen extends ConsumerWidget {
  final String name;
  const CommunityScreen({super.key, required this.name});

  static const routeName = '/r/:name';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(signedInUserProvider)!;
    return Scaffold(
      body: ref.watch(getCommunityByNameProvider(name)).when(
            data: (commnity) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 150,
                    // floating: true,
                    // snap: true,
                    pinned: true,
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(child: Image.network('https://placekitten.com/g/200/150', fit: BoxFit.cover)),
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
                                      onPressed: () {},
                                      child: const Text('Mod Tools'),
                                    )
                                  : OutlinedButton(
                                      onPressed: () {},
                                      child: Text(commnity.members.contains(user.uid) ? 'Joined' : 'Join'),
                                    )
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
              },
              body: const Column(
                children: [],
              ),
            ),
            error: rpErrorView,
            loading: rpLodingView,
          ),
    );
  }
}
