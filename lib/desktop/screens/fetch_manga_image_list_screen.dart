import 'package:flutter/material.dart';
import 'package:manga_v3/components/my_scaffold.dart';
import 'package:manga_v3/components/t_loader.dart';
import 'package:manga_v3/models/fetch_config_model.dart';
import 'package:manga_v3/models/fetch_manga_chapter_model.dart';
import 'package:manga_v3/models/fetch_manga_image_model.dart';

class FetchMangaImageListScreen extends StatefulWidget {
  FetchMangaChapterModel fetchMangaChapter;
  FetchConfigModel fetchConfig;
  FetchMangaImageListScreen({
    super.key,
    required this.fetchMangaChapter,
    required this.fetchConfig,
  });

  @override
  State<FetchMangaImageListScreen> createState() =>
      _FetchMangaImageListScreenState();
}

class _FetchMangaImageListScreenState extends State<FetchMangaImageListScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  List<FetchMangaImageModel> imageList = [];
  bool isLoading = false;

  void init() {
    setState(() {
      isLoading = true;
    });

    // getFetchMangaChapterList(
    //   fetchUrl: widget.fetchManga.url,
    //   listQuerySelector: widget.fetchConfig.queryChapterList,
    //   urlReplaceText: widget.fetchConfig.replaceListUrl,
    //   onError: (msg) {
    //     debugPrint(msg);
    //   },
    //   onSuccess: (list) {
    //     setState(() {
    //       chapterList = list;
    //       isLoading = false;
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: Text('Fetch Images ${widget.fetchMangaChapter.title}'),
      ),
      body: isLoading ? TLoader() : Container(),
    );
  }
}
