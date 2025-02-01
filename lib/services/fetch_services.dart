import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:manga_v3/models/fetch_manga_chapter_model.dart';
import 'package:manga_v3/models/fetch_manga_model.dart';
// void getFetchPageNavigationList({
//   required String pageUrl,
//   void Function(List<ApyarModel> list)? onSuccess,
//   void Function(String msg)? onError,
// }) async {
//   try {
//     final url = Uri.parse(pageUrl);
//     final res = await http.get(url);
//     if (res.statusCode == 200) {
//     } else {}
//   } catch (e) {
//     if (onError != null) {
//       onError('getFetchPageNavigationList: ${e.toString()}');
//     }
//   }
// }

Future<void> getFetchMangaChapterList({
  required String fetchUrl,
  required String listQuerySelector,
  String urlReplaceText = '',
  void Function(List<FetchMangaChapterModel> list)? onSuccess,
  void Function(String msg)? onError,
}) async {
  try {
    List<FetchMangaChapterModel> list = [];

    final url = Uri.parse(fetchUrl);
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var dom = parse(res.body);
      //list
      var eList = dom.querySelectorAll(listQuerySelector);

      for (var el in eList) {
        try {
          String title = el.querySelector('a')!.text;
          String url = el.querySelector('a')!.attributes['href'] ?? '';
          String coverUrl =
              el.querySelector('img')!.attributes['data-original'] ?? '';

          if (title.isEmpty) continue;
          //remove space
          title = title.trim();
          url = url.trim();
          coverUrl = coverUrl.trim();
          //url replace
          if (urlReplaceText.isNotEmpty) {
            url = url.replaceAll('./', '$urlReplaceText/');
          }

          list.add(FetchMangaChapterModel(
            title: title,
            url: url,
            coverUrl: coverUrl,
          ));
        } catch (e) {}
      }

      if (onSuccess != null) {
        onSuccess(list);
      }
    }
  } catch (e) {
    if (onError != null) {
      onError(e.toString());
    }
    debugPrint('getFetchMangaList: ${e.toString()}');
  }
}

Future<void> getFetchMangaList({
  required String fetchUrl,
  required String listQuerySelector,
  String urlReplaceText = '',
  void Function(List<FetchMangaModel> list)? onSuccess,
  void Function(String msg)? onError,
}) async {
  List<FetchMangaModel> list = [];

  try {
    final url = Uri.parse(fetchUrl);
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var dom = parse(res.body);
      //list
      var eList = dom.querySelectorAll(listQuerySelector);

      for (var el in eList) {
        try {
          String title = el.querySelector('a')!.text;
          String url = el.querySelector('a')!.attributes['href'] ?? '';
          String coverUrl =
              el.querySelector('img')!.attributes['data-original'] ?? '';
          if (title.isEmpty) continue;
          title = title.trim();
          url = url.trim();
          coverUrl = coverUrl.trim();
          //url replace
          if (urlReplaceText.isNotEmpty) {
            url = url.replaceAll('./', '$urlReplaceText/');
          }

          list.add(FetchMangaModel(
            title: title,
            url: url,
            coverUrl: coverUrl,
          ));
        } catch (e) {}
      }
      if (onSuccess != null) {
        onSuccess(list);
      }
    } else {
      if (onError != null) {
        onError('is have error');
      }
    }
  } catch (e) {
    if (onError != null) {
      onError(e.toString());
    }
    debugPrint('getFetchMangaList: ${e.toString()}');
  }
}
