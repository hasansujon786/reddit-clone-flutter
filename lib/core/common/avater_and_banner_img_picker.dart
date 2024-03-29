import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AvaterAndBannerImgPicker extends StatelessWidget {
  final void Function() onTapProfle;
  final void Function() onTapBanner;
  final File? profileFile;
  final File? bannerFile;
  final String bannerImage;
  final String profileImage;

  const AvaterAndBannerImgPicker({
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
          child: ImagePickerBox(onTap: onTapBanner, imageUrl: bannerImage, imageFile: bannerFile),
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

  ImageProvider<Object> getAvaterImage(String avaterImage, File? avaterFile) {
    if (avaterFile == null) {
      return NetworkImage(avaterImage);
    }
    return FileImage(avaterFile);
  }
}

class ImagePickerBox extends StatelessWidget {
  const ImagePickerBox({
    super.key,
    this.imageUrl = '',
    this.imageFile,
    required this.onTap,
  });

  final void Function() onTap;
  final File? imageFile;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          child: buildBannerImage(imageUrl, imageFile),
        ),
      ),
    );
  }

  Widget buildBannerImage(String imageUrl, File? imageFile) {
    if (imageFile != null) {
      return Image.file(imageFile, fit: BoxFit.cover);
    }
    return imageUrl.isEmpty || imageUrl == Constants.bannerDefault
        ? const Center(child: Icon(Icons.camera_alt_outlined, size: 36))
        : Image.network(imageUrl, fit: BoxFit.cover);
  }
}
