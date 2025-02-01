import 'package:flutter/material.dart';
import 'package:manga_v3/components/manga_grid_view.dart';
import 'package:manga_v3/components/my_scaffold.dart';
import 'package:manga_v3/desktop/screens/fetch_manga_list_screen.dart';
import 'package:manga_v3/desktop/screens/manga_chapter_screen.dart';
import 'package:manga_v3/drawer/main_drawer.dart';
import 'package:manga_v3/notifier/manga_notifer.dart';
import 'package:manga_v3/utils/fetch_config_util.dart';
import 'package:manga_v3/utils/manga_util.dart';

class DesktopApp extends StatefulWidget {
  const DesktopApp({super.key});

  @override
  State<DesktopApp> createState() => _DesktopAppState();
}

class _DesktopAppState extends State<DesktopApp> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    mangaListNotifier.value = getMangaList();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(),
      drawer: const MainDrawer(),
      body: ValueListenableBuilder(
        valueListenable: mangaListNotifier,
        builder: (context, mangaList, child) {
          if (mangaList.isEmpty) {
            return Center(
              child: Column(
                children: [
                  const Text('Manga is empty'),
                  IconButton(
                    onPressed: () {
                      init();
                    },
                    icon: const Icon(
                      Icons.refresh,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                Future.delayed(const Duration(milliseconds: 2000));
                init();
              },
              child: MangaGridView(
                mangaList: mangaList,
                onClick: (manga) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MangaChapterScreen(manga: manga),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final fetchConfig = getFetchConfigList()[0];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FetchMangaListScreen(
                fetchConfig: fetchConfig,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
