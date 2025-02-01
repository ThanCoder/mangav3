import 'package:flutter/material.dart';
import 'package:manga_v3/components/my_image_url.dart';
import 'package:manga_v3/models/fetch_manga_model.dart';

class FetchMangaListView extends StatelessWidget {
  List<FetchMangaModel> fetchMangaList;
  void Function(FetchMangaModel fetchManga)? onClick;
  FetchMangaListView({super.key, required this.fetchMangaList, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: fetchMangaList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200),
      itemBuilder: (context, index) => _listItem(
        fetchManga: fetchMangaList[index],
        onClick: (fetchManga) {
          if (onClick != null) {
            onClick!(fetchManga);
          }
        },
      ),
    );
  }
}

class _listItem extends StatelessWidget {
  FetchMangaModel fetchManga;
  void Function(FetchMangaModel fetchManga) onClick;
  _listItem({required this.fetchManga, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(fetchManga),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: MyImageUrl(
                url: fetchManga.coverUrl,
              ),
            ),
            Text(fetchManga.title),
          ],
        ),
      ),
    );
  }
}
