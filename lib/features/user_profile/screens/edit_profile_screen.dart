import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/constants/constants.dart';
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
                      AvaterAndBannerPickerBox(
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

class AvaterAndBannerPickerBox extends StatelessWidget {
  final void Function() onTapProfle;
  final void Function() onTapBanner;
  final File? profileFile;
  final File? bannerFile;
  final String bannerImage;
  final String profileImage;

  const AvaterAndBannerPickerBox({
    super.key,
    required this.profileFile,
    required this.bannerFile,
    required this.bannerImage,
    required this.profileImage,
    required this.onTapProfle,
    required this.onTapBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: onTapBanner,
            child: DottedBorder(
              color: Colors.white,
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              strokeCap: StrokeCap.round,
              dashPattern: const [10, 4],
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: buildBannerImage(bannerImage, bannerFile),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          left: 24,
          child: GestureDetector(
            onTap: onTapProfle,
            child: CircleAvatar(
              backgroundImage: getAvaterImage(profileImage, profileFile),
              backgroundColor: Colors.grey.shade400,
              radius: 35,
            ),
          ),
        )
      ],
    );
  }

  Widget buildBannerImage(String bannerImage, File? bannerFile) {
    if (bannerFile != null) {
      return Image.file(bannerFile, fit: BoxFit.cover);
    }
    return bannerImage.isEmpty || bannerImage == Constants.bannerDefault
        ? const Center(child: Icon(Icons.camera_alt_outlined, size: 36))
        : Image.network(bannerImage, fit: BoxFit.cover);
  }

  ImageProvider<Object> getAvaterImage(String avaterImage, File? avaterFile) {
    if (avaterFile == null) {
      return NetworkImage(avaterImage);
    }
    return FileImage(avaterFile);
  }
}
