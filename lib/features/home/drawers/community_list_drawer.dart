import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/common/loader.dart';
import '../../../core/common/error_text.dart';
import '../../community/controller/community_controller.dart';
import '../../community/screens/create_community_screens.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({super.key});

  void navigateToCommunity(BuildContext context, String name) {
    Routemaster.of(context).push('r/$name');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('Create a community'),
              leading: const Icon(Icons.add),
              onTap: () => Routemaster.of(context).push(CreateCommunityScreens.routeName),
            ),
            ref.watch(userCommunitiesProvider).when(
                data: (communities) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: communities.length,
                      itemBuilder: (context, index) {
                        final comm = communities[index];
                        return ListTile(
                          onTap: () => navigateToCommunity(context, comm.name),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(comm.avater),
                          ),
                          title: Text('r/${comm.name}'),
                        );
                      },
                    ),
                  );
                },
                error: (e, stack) => ErrorText(error: e.toString()),
                loading: () => const Loader())
          ],
        ),
      ),
    );
  }
}
