import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'add_mods_screen.dart';

class ModsToolsScreen extends StatelessWidget {
  final String name;
  const ModsToolsScreen({super.key, required this.name});

  static const routeName = '/mod-tools/:name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mod Tools'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.add_moderator),
            title: const Text('Add Moderators'),
            onTap: () => AddModsScreen.navigate(context, name),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Community'),
            onTap: () {
              Routemaster.of(context).push('/edit-community/$name');
            },
          ),
        ],
      ),
    );
  }
}
