import 'package:flutter/material.dart';
import 'package:manga_v3/components/manga_chapter_list_view.dart';
import 'package:manga_v3/components/my_scaffold.dart';
import 'package:manga_v3/desktop/screens/manga_chapter_image_screen.dart';
import 'package:manga_v3/models/manga_model.dart';
import 'package:manga_v3/notifier/manga_notifer.dart';
import 'package:manga_v3/utils/manga_util.dart';

class MangaChapterScreen extends StatefulWidget {
  MangaModel manga;
  MangaChapterScreen({super.key, required this.manga});

  @override
  State<MangaChapterScreen> createState() => _MangaChapterScreenState();
}

class _MangaChapterScreenState extends State<MangaChapterScreen> {
  @override
  void initState() {
    mangaChapterListNotifier.value = getMangaChapterList(widget.manga.path);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      contentPadding: 8,
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: mangaChapterListNotifier,
        builder: (context, value, child) {
          return MangaChapterListView(
            mangaChapterList: value,
            onClick: (mangaChapter) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MangaChapterImageScreen(mangaChapter: mangaChapter),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
