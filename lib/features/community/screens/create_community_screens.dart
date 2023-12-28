import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/Loader.dart';
import '../controller/community_controller.dart';

class CreateCommunityScreens extends ConsumerStatefulWidget {
  const CreateCommunityScreens({super.key});

  static const routeName = '/create-community';

  @override
  ConsumerState<CreateCommunityScreens> createState() => _CreateCommunityScreensState();
}

class _CreateCommunityScreensState extends ConsumerState<CreateCommunityScreens> {
  final _communityNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _communityNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCommnityCreateLoading = ref.watch(communityControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a community'),
      ),
      body: isCommnityCreateLoading ? const Loader() : Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Community name'),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLength: 21,
              controller: _communityNameController,
              decoration: const InputDecoration(
                hintText: 'r/community_name',
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ref.read(communityControllerProvider.notifier).createCommunity(
                      _communityNameController.text.trim(),
                      context,
                    );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Create Community'),
            )
          ],
        ),
      ),
    );
  }
}
