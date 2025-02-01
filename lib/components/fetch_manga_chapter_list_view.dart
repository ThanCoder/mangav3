import 'package:flutter/material.dart';
import 'package:manga_v3/components/my_image_url.dart';
import 'package:manga_v3/models/fetch_manga_chapter_model.dart';

class FetchMangaChapterListView extends StatelessWidget {
  List<FetchMangaChapterModel> chapterList;
  void Function(FetchMangaChapterModel chapter)? onClick;
  FetchMangaChapterListView({
    super.key,
    required this.chapterList,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: chapterList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200),
      itemBuilder: (context, index) => _listItem(
        chapter: chapterList[index],
        onClick: (chapter) {
          if (onClick != null) {
            onClick!(chapter);
          }
        },
      ),
    );
  }
}

class _listItem extends StatelessWidget {
  FetchMangaChapterModel chapter;
  void Function(FetchMangaChapterModel chapter) onClick;
  _listItem({required this.chapter, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(chapter),
      child: Card(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: MyImageUrl(
                    url: chapter.coverUrl,
                  ),
                ),
                Text(chapter.title),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                    chapter.isExists ? Icons.download_done : Icons.download),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
