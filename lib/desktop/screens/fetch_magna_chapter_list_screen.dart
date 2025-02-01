import 'package:flutter/material.dart';
import 'package:manga_v3/components/fetch_manga_chapter_list_view.dart';
import 'package:manga_v3/components/my_scaffold.dart';
import 'package:manga_v3/components/t_loader.dart';
import 'package:manga_v3/desktop/screens/fetch_manga_image_list_screen.dart';
import 'package:manga_v3/models/fetch_config_model.dart';
import 'package:manga_v3/models/fetch_manga_chapter_model.dart';
import 'package:manga_v3/models/fetch_manga_model.dart';
import 'package:manga_v3/services/fetch_services.dart';

class FetchMagnaChapterListScreen extends StatefulWidget {
  FetchMangaModel fetchManga;
  FetchConfigModel fetchConfig;
  FetchMagnaChapterListScreen({
    super.key,
    required this.fetchManga,
    required this.fetchConfig,
  });

  @override
  State<FetchMagnaChapterListScreen> createState() =>
      _FetchMagnaChapterListScreenState();
}

class _FetchMagnaChapterListScreenState
    extends State<FetchMagnaChapterListScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  List<FetchMangaChapterModel> chapterList = [];
  bool isLoading = false;

  void init() {
    setState(() {
      isLoading = true;
    });

    getFetchMangaChapterList(
      fetchUrl: widget.fetchManga.url,
      listQuerySelector: widget.fetchConfig.queryChapterList,
      urlReplaceText: widget.fetchConfig.replaceListUrl,
      onError: (msg) {
        debugPrint(msg);
      },
      onSuccess: (list) {
        setState(() {
          chapterList = list;
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: Text('Fetch Chapters ${widget.fetchManga.title}'),
      ),
      body: isLoading
          ? TLoader()
          : FetchMangaChapterListView(
              chapterList: chapterList,
              onClick: (chapter) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FetchMangaImageListScreen(
                      fetchMangaChapter: chapter,
                      fetchConfig: widget.fetchConfig,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
