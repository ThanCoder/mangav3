import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manga_v3/models/manga_chapter_model.dart';
import 'package:manga_v3/models/manga_image_model.dart';
import 'package:manga_v3/notifier/manga_notifer.dart';
import 'package:manga_v3/utils/path_util.dart';

import '../models/manga_model.dart';

int getMangaChapterPosition(MangaChapterModel chapter) {
  int res = -1;
  int i = 0;
  for (final ch in mangaChapterListNotifier.value) {
    if (ch.title == chapter.title) {
      res = i;
      break;
    }
    i++;
  }
  return res;
}

List<MangaImageModel> getMangaImageList(String path) {
  List<MangaImageModel> list = [];
  try {
    final dir = Directory(path);
    if (!dir.existsSync()) return [];

    for (final file in dir.listSync()) {
      //check dir
      if (file.statSync().type == FileSystemEntityType.file) {
        list.add(MangaImageModel(
          title: getBasename(file.path),
          path: file.path,
        ));
      }
    }
    list.sort((a, b) {
      // Extract the numbers from the titles
      int numA = int.parse(a.title.split('.')[0]);
      int numB = int.parse(b.title.split('.')[0]);
      return numA.compareTo(numB); // Sort ascending
    });
  } catch (e) {
    debugPrint('getMangaList: ${e.toString()}');
  }
  return list;
}

List<MangaChapterModel> getMangaChapterList(String path) {
  List<MangaChapterModel> list = [];
  try {
    final dir = Directory(path);
    if (!dir.existsSync()) return [];

    for (final file in dir.listSync()) {
      //check dir
      if (file.statSync().type == FileSystemEntityType.directory) {
        list.add(MangaChapterModel(
          title: getBasename(file.path),
          path: file.path,
        ));
      }
    }
    list.sort((a, b) {
      int an = int.parse(a.title.split(' ')[1]);
      int bn = int.parse(b.title.split(' ')[1]);
      return an.compareTo(bn);
    });
  } catch (e) {
    debugPrint('getMangaList: ${e.toString()}');
  }
  return list;
}

List<MangaModel> getMangaList() {
  List<MangaModel> list = [];
  try {
    final dir = Directory(getSourcePath());

    if (!dir.existsSync()) return [];

    for (final file in dir.listSync()) {
      //check dir
      if (file.statSync().type == FileSystemEntityType.directory) {
        list.add(MangaModel(
          title: getBasename(file.path),
          path: file.path,
          date: file.statSync().modified.millisecondsSinceEpoch,
        ));
      }
    }
  } catch (e) {
    debugPrint('getMangaList: ${e.toString()}');
  }
  return list;
}
