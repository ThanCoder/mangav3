import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manga_v3/components/my_image_file.dart';
import 'package:manga_v3/models/manga_chapter_model.dart';
import 'package:manga_v3/utils/manga_util.dart';

class MangaChapterListView extends StatelessWidget {
  List<MangaChapterModel> mangaChapterList;
  void Function(MangaChapterModel mangaChapter)? onClick;
  MangaChapterListView({
    super.key,
    required this.mangaChapterList,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200),
      itemBuilder: (context, index) => _ListItem(
        chapter: mangaChapterList[index],
        onClick: (chapter) {
          if (onClick != null) {
            onClick!(mangaChapterList[index]);
          }
        },
      ),
      itemCount: mangaChapterList.length,
    );
  }
}

class _ListItem extends StatelessWidget {
  MangaChapterModel chapter;
  void Function(MangaChapterModel chapter) onClick;
  _ListItem({required this.chapter, required this.onClick});

  String getImagePath() {
    String res = chapter.coverPath;
    final images = getMangaImageList(chapter.path);
    if (images.length > 0 && !File(res).existsSync()) {
      res = images[0].path;
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(chapter),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: MyImageFile(
                path: getImagePath(),
                fit: BoxFit.cover,
              ),
            ),
            Text(chapter.title),
          ],
        ),
      ),
    );
  }
}
