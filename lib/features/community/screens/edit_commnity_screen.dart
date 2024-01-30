import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/avater_and_banner_img_picker.dart';
import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';
import '../../../core/constants/constants.dart';
import '../../../core/models/community.dart';
import '../../../core/utils.dart';
import '../controller/community_controller.dart';

class EditCommnityScreen extends ConsumerStatefulWidget {
  final String name;
  const EditCommnityScreen({super.key, required this.name});

  static const routeName = '/edit-community/:name';
  @override
  ConsumerState<EditCommnityScreen> createState() => _EditCommnityScreenState();
}

class _EditCommnityScreenState extends ConsumerState<EditCommnityScreen> {
  File? newBannerFile;
  File? newProfileFile;

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

  void save(Community community) {
    ref.read(communityControllerProvider.notifier).editCommunity(
          context: context,
          community: community,
          avaterFile: newProfileFile,
          bannerFile: newBannerFile,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(communityControllerProvider);

    return ref.watch(GetCommunityByNameProvider(widget.name)).when(
        data: (community) {
          return Scaffold(
            // backgroundColor: Pallete.darkModeAppTheme.,
            appBar: AppBar(
              title: const Text('Edit Commnity'),
              actions: [
                TextButton(
                  onPressed: () => save(community),
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
                        bannerImage: community.banner,
                        profileImage: community.banner,
                        onTapProfle: selectProfileImage,
                        onTapBanner: selectBannerImage,
                      ),
                      Text(community.name),
                    ],
                  ),
          );
        },
        error: rpErrorView,
        loading: rpLodingView);
  }

  Widget buildBannerImage(Community community, File? newBannerFile) {
    if (newBannerFile != null) {
      return Image.file(newBannerFile, fit: BoxFit.cover);
    }
    return community.banner.isEmpty || community.banner == Constants.bannerDefault
        ? const Center(child: Icon(Icons.camera_alt_outlined, size: 36))
        : Image.network(community.banner, fit: BoxFit.cover);
  }
}
