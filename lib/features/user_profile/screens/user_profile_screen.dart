import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../auth/controller/auth_cotroller.dart';

class UserProfileScreen extends ConsumerWidget {
  final String uid;
  const UserProfileScreen({required this.uid, super.key});

  static const routeName = '/u/:uid';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getUserDataProvider(uid)).when(
          data: (user) {
            if (user == null) return const SizedBox();

            return Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    expandedHeight: 250,
                    // floating: true,
                    // snap: true,
                    pinned: true,
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(child: Image.network(user.banner, fit: BoxFit.cover)),
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
                            child: CircleAvatar(backgroundImage: NetworkImage(user.displayImage), radius: 35),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'u/${user.name}',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Routemaster.of(context).push('/edit-user/${user.uid}');
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                  minimumSize: const Size(40, 30),
                                ),
                                child: const Text('Edit Profile', style: TextStyle(fontSize: 12)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text('${user.karma} karma'),
                          ),
                          const Divider(thickness: 2),
                        ],
                      ),
                    ),
                  )
                ],
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
}
