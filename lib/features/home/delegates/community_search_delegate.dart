import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../community/controller/community_controller.dart';

class CommunitySearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, widget) {
        return ref.watch(searchCommunityProvider(query)).when(
              data: (communites) {
                return ListView.builder(
                  itemCount: communites.length,
                  itemBuilder: (BuildContext context, int index) {
                    final community = communites[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(community.avater),
                      ),
                      title: Text('r/${community.name}'),
                      // onTap: () => navigateToCommunity(context, community.name),
                    );
                  },
                );
              },
              error: rpErrorView,
              loading: rpLodingView,
            );
      },
    );
  }
}

