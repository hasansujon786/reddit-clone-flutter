import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/avater_and_banner_img_picker.dart';
import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/models/user_model.dart';
import '../../../core/utils.dart';
import '../../auth/controller/auth_cotroller.dart';
import '../controller/user_profile_controller.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final String uid;
  const EditProfileScreen({
    super.key,
    required this.uid,
  });

  static const routeName = '/edit-user/:uid';

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    nameTextController = TextEditingController(text: ref.read(signedInUserProvider)!.name);
  }

  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
  }

  File? newBannerFile;
  File? newProfileFile;
  late TextEditingController nameTextController;

  void selectBannerImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        newBannerFile = File(res.files.single.path!);
      });
    }
  }

  void selectProfileImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        newProfileFile = File(res.files.single.path!);
      });
    }
  }

  void save(UserModel user) {
    ref.read(userProfileControllerProvider.notifier).editProfile(
          context: context,
          updatedUser: user.copyWith(name: nameTextController.text),
          avaterFile: newProfileFile,
          bannerFile: newBannerFile,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(userProfileControllerProvider);

    return ref.watch(getUserDataProvider(widget.uid)).when(
        data: (user) {
          if (user == null) return const SizedBox();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Edit Profile'),
              actions: [
                TextButton(
                  onPressed: () => save(user),
                  child: const Text('Save'),
                ),
              ],
            ),
            body: isLoading
                ? const Loader()
                : Column(
                    children: [
                      AvaterAndBannerImgPicker(
                        profileFile: newProfileFile,
                        bannerFile: newBannerFile,
                        bannerImage: user.banner,
                        profileImage: user.displayImage,
                        onTapProfle: selectProfileImage,
                        onTapBanner: selectBannerImage,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0).copyWith(top: 40),
                        child: TextField(
                          controller: nameTextController,
                          decoration: const InputDecoration(hintText: 'Name'),
                        ),
                      ),
                    ],
                  ),
          );
        },
        error: rpErrorView,
        loading: rpLodingView);
  }
}
