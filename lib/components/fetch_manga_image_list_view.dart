import 'package:flutter/material.dart';
import 'package:manga_v3/models/fetch_manga_chapter_model.dart';
import 'package:manga_v3/models/fetch_manga_image_model.dart';

class FetchMangaImageListView extends StatelessWidget {
  List<FetchMangaImageModel> imageList;
  void Function(FetchMangaChapterModel chapter)? onClick;
  FetchMangaImageListView({
    super.key,
    required this.imageList,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
