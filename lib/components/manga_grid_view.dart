import 'package:flutter/material.dart';
import 'package:manga_v3/components/my_image_file.dart';
import 'package:manga_v3/models/manga_model.dart';

class MangaGridView extends StatelessWidget {
  List<MangaModel> mangaList;
  void Function(MangaModel manga)? onClick;
  MangaGridView({
    super.key,
    required this.mangaList,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: mangaList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200),
      itemBuilder: (context, index) => _GridItem(
        manga: mangaList[index],
        onClick: (manga) {
          if (onClick != null) {
            onClick!(manga);
          }
        },
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  MangaModel manga;
  void Function(MangaModel manga) onClick;
  _GridItem({
    required this.manga,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(manga),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: MyImageFile(path: manga.coverPath),
            ),
            const SizedBox(height: 5),
            Text(manga.title),
          ],
        ),
      ),
    );
  }
}
