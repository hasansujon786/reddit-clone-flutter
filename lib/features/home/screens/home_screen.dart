import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controller/auth_cotroller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(signedInUserProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Text(user.name),
      ),
    );
  }
}
