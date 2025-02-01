import 'package:flutter/material.dart';
import 'package:manga_v3/components/my_image_file.dart';
import 'package:manga_v3/models/manga_image_model.dart';

class MangaImageListView extends StatelessWidget {
  List<MangaImageModel> imageList;
  ScrollController? controller;
  MangaImageListView({
    super.key,
    required this.imageList,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: imageList.length,
      itemBuilder: (context, index) => _ListItem(image: imageList[index]),
    );
  }
}

class _ListItem extends StatelessWidget {
  MangaImageModel image;
  _ListItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return MyImageFile(path: image.path);
  }
}
