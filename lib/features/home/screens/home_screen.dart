import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controller/auth_cotroller.dart';
import '../delegates/community_search_delegate.dart';
import '../drawers/community_list_drawer.dart';
import '../drawers/profile_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(signedInUserProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CommunitySearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: CircleAvatar(backgroundImage: NetworkImage(user.displayImage)),
            );
          })
        ],
      ),
      body: Center(
        child: Text(user.name),
      ),
      drawer: const CommunityListDrawer(),
      endDrawer: const ProfileDrawer(),
    );
  }
}
