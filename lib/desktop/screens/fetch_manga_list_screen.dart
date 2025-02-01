import 'package:flutter/material.dart';
import 'package:manga_v3/components/fetch_manga_list_view.dart';
import 'package:manga_v3/components/my_scaffold.dart';
import 'package:manga_v3/components/t_loader.dart';
import 'package:manga_v3/desktop/screens/fetch_magna_chapter_list_screen.dart';
import 'package:manga_v3/models/fetch_config_model.dart';
import 'package:manga_v3/models/fetch_manga_model.dart';
import 'package:manga_v3/services/fetch_services.dart';

class FetchMangaListScreen extends StatefulWidget {
  FetchConfigModel fetchConfig;
  FetchMangaListScreen({super.key, required this.fetchConfig});

  @override
  State<FetchMangaListScreen> createState() => _FetchMangaListScreenState();
}

class _FetchMangaListScreenState extends State<FetchMangaListScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  List<FetchMangaModel> fetchList = [];
  bool isLoading = false;

  void init() {
    setState(() {
      isLoading = true;
    });
    getFetchMangaList(
      fetchUrl: widget.fetchConfig.initUrl,
      listQuerySelector: widget.fetchConfig.queryMangaList,
      urlReplaceText: widget.fetchConfig.replaceListUrl,
      onError: (msg) {
        debugPrint(msg);
      },
      onSuccess: (list) {
        setState(() {
          fetchList = list;
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: Text('Fetch Manga from ${widget.fetchConfig.title}'),
      ),
      body: isLoading
          ? TLoader()
          : FetchMangaListView(
              fetchMangaList: fetchList,
              onClick: (fetchManga) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FetchMagnaChapterListScreen(
                      fetchManga: fetchManga,
                      fetchConfig: widget.fetchConfig,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
