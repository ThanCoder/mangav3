import 'package:flutter/material.dart';
import 'package:manga_v3/components/manga_image_list_view.dart';
import 'package:manga_v3/components/my_scaffold.dart';
import 'package:manga_v3/models/manga_chapter_model.dart';
import 'package:manga_v3/notifier/manga_notifer.dart';
import 'package:manga_v3/services/android_app_services.dart';
import 'package:manga_v3/utils/manga_util.dart';

class MangaChapterImageScreen extends StatefulWidget {
  MangaChapterModel mangaChapter;
  MangaChapterImageScreen({super.key, required this.mangaChapter});

  @override
  State<MangaChapterImageScreen> createState() =>
      _MangaChapterImageScreenState();
}

class _MangaChapterImageScreenState extends State<MangaChapterImageScreen> {
  @override
  void initState() {
    mangaChapter = widget.mangaChapter;
    mangaImageListNotifier.value = getMangaImageList(mangaChapter.path);
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  bool isFullScreen = false;
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isShowNextBtn = false;
  late MangaChapterModel mangaChapter;

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      checkNextChapter();
    }
  }

  void checkNextChapter() {
    if (isLoading) return;
    int pos = getMangaChapterPosition(mangaChapter);
    int allLength = mangaChapterListNotifier.value.length;
    if (allLength > 0 && pos + 1 < allLength) {
      setState(() {
        isLoading = true;
        isShowNextBtn = true;
      });
    }
  }

  void loadData() {
    int pos = getMangaChapterPosition(mangaChapter);
    int allLength = mangaChapterListNotifier.value.length;
    if (allLength > 0 && pos + 1 < allLength) {}
    final res = mangaChapterListNotifier.value[pos + 1];

    setState(() {
      mangaChapter = res;
      isShowNextBtn = false;
    });
    mangaImageListNotifier.value = getMangaImageList(mangaChapter.path);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        toggleAndroidFullScreen(false);
        return true;
      },
      child: MyScaffold(
        appBar: !isFullScreen
            ? AppBar(
                title: Text(mangaChapter.title),
              )
            : null,
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: mangaImageListNotifier,
            builder: (context, value, child) {
              isLoading = false;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isFullScreen = !isFullScreen;
                  });
                  toggleAndroidFullScreen(isFullScreen);
                },
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: MangaImageListView(
                        controller: _scrollController, imageList: value),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: isShowNextBtn
            ? FloatingActionButton(
                onPressed: () {
                  loadData();
                },
                child: const Icon(Icons.navigate_next),
              )
            : null,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
