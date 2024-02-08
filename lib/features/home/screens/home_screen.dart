import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controller/auth_cotroller.dart';
import '../../feed/screens/feed_screen.dart';
import '../../post/screens/add_post_screen.dart';
import '../delegates/community_search_delegate.dart';
import '../drawers/community_list_drawer.dart';
import '../drawers/profile_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
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
      body: const [
        FeedScreen(),
        AddPostScreen(),
      ][_page],
      drawer: const CommunityListDrawer(),
      endDrawer: const ProfileDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (page) {
          setState(() {
            _page = page;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
      ),
    );
  }
}
