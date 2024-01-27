import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../auth/controller/auth_cotroller.dart';
import '../controller/community_controller.dart';

class AddModsScreen extends ConsumerStatefulWidget {
  final String name;
  const AddModsScreen({super.key, required this.name});

  @override
  ConsumerState<AddModsScreen> createState() => _AddModsScreenState();

  static const routeName = '/add_mods/:name';
  static void navigate(BuildContext context, String communityName) {
    Routemaster.of(context).push('/add_mods/$communityName');
  }
}

class _AddModsScreenState extends ConsumerState<AddModsScreen> {
  bool isInit = true;

  Set<String> modUids = {};
  void toggleModUid(bool shouldCheck, String uid) {
    if (shouldCheck) {
      modUids.add(uid);
    } else {
      modUids.remove(uid);
    }

    setState(() {});
  }

  void updateMods(BuildContext context, String communityName, List<String> uids) {
    ref.read(communityControllerProvider.notifier).addMods(context, communityName, uids);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mods'),
        actions: [
          IconButton(
            onPressed: () {
              updateMods(context, widget.name, modUids.toList());
            },
            icon: const Icon(Icons.done_all),
          ),
        ],
      ),
      body: ref.watch(getCommunityByNameProvider(widget.name)).when(
            data: (community) {
              if (isInit) {
                modUids = {...community.mods};
              }
              isInit = false;

              return ListView.builder(
                itemCount: community.members.length,
                itemBuilder: (BuildContext context, int index) {
                  final uid = community.members[index];
                  return ref.watch(getUserDataProvider(uid)).when(
                        data: (user) {
                          return CheckboxListTile(
                            value: modUids.contains(uid),
                            onChanged: (shouldCheck) => toggleModUid(shouldCheck!, uid),
                            title: Text(user!.name),
                          );
                        },
                        error: rpErrorView,
                        loading: rpLodingView,
                      );
                },
              );
            },
            error: rpErrorView,
            loading: rpLodingView,
          ),
    );
  }
}
