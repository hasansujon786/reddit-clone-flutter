import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/avater_and_banner_img_picker.dart';
import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/models/community.dart';
import '../../../core/utils.dart';
import '../../community/controller/community_controller.dart';
import '../controller/post_controller.dart';

class AddPostTypeScreen extends ConsumerStatefulWidget {
  final String type;
  const AddPostTypeScreen({
    super.key,
    required this.type,
  });

  static const routeName = '/add-post/:type';

  @override
  ConsumerState<AddPostTypeScreen> createState() => _AddPostTypeScreenState();
}

class _AddPostTypeScreenState extends ConsumerState<AddPostTypeScreen> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController linkController = TextEditingController();

  Community? selectedCommunity;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    linkController.dispose();
    super.dispose();
  }

  File? imageFile;
  void selectImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        imageFile = File(res.files.single.path!);
      });
    }
  }

  void sharePost(BuildContext context, WidgetRef ref) {
    if (selectedCommunity == null) {
      return showSnackBar(context, 'Select a community');
    }

    if (widget.type == 'image' && imageFile != null && titleController.text.isNotEmpty) {
      ref.read(postControllerProvider.notifier).shareImagePost(
            context,
            selectedCommunity!,
            title: titleController.text.trim(),
            imageFile: imageFile,
          );
    } else if (widget.type == 'text' && titleController.text.isNotEmpty) {
      ref.read(postControllerProvider.notifier).shareTextPost(
            context,
            selectedCommunity!,
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
          );
    } else if (widget.type == 'link' && titleController.text.isNotEmpty && linkController.text.isNotEmpty) {
      ref.read(postControllerProvider.notifier).shareLinkPost(
            context,
            selectedCommunity!,
            title: titleController.text.trim(),
            link: linkController.text.trim(),
          );
    } else {
      showSnackBar(context, 'Please enter all the required fields.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final postIsLoading = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Post ${widget.type}'),
        actions: [
          TextButton(
            onPressed: () => sharePost(context, ref),
            child: const Text('Share'),
          ),
        ],
      ),
      body: postIsLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(hintText: 'Enter title here'),
                    controller: titleController,
                    maxLength: 30,
                  ),
                  const SizedBox(height: 16),
                  buildInputs(),
                  const SizedBox(height: 20),
                  const Text('Select Community'),
                  buildCommunityPicker()
                ],
              ),
            ),
    );
  }

  Widget buildInputs() {
    final isTypeImage = widget.type == 'image';
    final isTypeText = widget.type == 'text';
    final isTypeLink = widget.type == 'link';

    if (isTypeImage) {
      return ImagePickerBox(
        onTap: selectImage,
        imageFile: imageFile,
      );
    } else if (isTypeText) {
      return TextField(
        maxLines: 5,
        decoration: const InputDecoration(hintText: 'Enter description here'),
        controller: descriptionController,
      );
    } else if (isTypeLink) {
      return TextField(
        decoration: const InputDecoration(hintText: 'Enter description here'),
        controller: linkController,
      );
    }

    return const SizedBox();
  }

  Widget buildCommunityPicker() {
    return ref.watch(userCommunitiesProvider).when(
          data: (communities) {
            if (communities.isEmpty) return const SizedBox();
            return DropdownButton(
              isExpanded: true,
              value: selectedCommunity,
              hint: const Text('Pick a community'),
              items: communities.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
              onChanged: (val) {
                setState(() {
                  selectedCommunity = val;
                });
              },
            );
          },
          error: rpErrorView,
          loading: rpLodingView,
        );
  }
}
