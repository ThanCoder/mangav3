import 'package:flutter/material.dart';
import 'package:manga_v3/models/manga_chapter_model.dart';
import 'package:manga_v3/models/manga_image_model.dart';
import 'package:manga_v3/models/manga_model.dart';

ValueNotifier<List<MangaModel>> mangaListNotifier = ValueNotifier([]);
ValueNotifier<List<MangaChapterModel>> mangaChapterListNotifier =
    ValueNotifier([]);
ValueNotifier<List<MangaImageModel>> mangaImageListNotifier = ValueNotifier([]);
