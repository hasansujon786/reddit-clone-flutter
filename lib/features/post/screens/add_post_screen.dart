import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  void navigateToType(BuildContext context, String type) {
    Routemaster.of(context).push('/add-post/$type');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildIconCard(context, Icons.image_outlined, 'image'),
        buildIconCard(context, Icons.font_download_outlined, 'text'),
        buildIconCard(context, Icons.link_outlined, 'link'),
      ],
    );
  }

  Widget buildIconCard(BuildContext context, IconData icon, String type) {
    return GestureDetector(
      onTap: () => navigateToType(context, type),
      child: SizedBox(
        height: 120,
        width: 120,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 16,
          child: Center(child: Icon(icon, size: 32)),
        ),
      ),
    );
  }
}
