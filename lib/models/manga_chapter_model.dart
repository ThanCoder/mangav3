// ignore_for_file: public_member_api_docs, sort_constructors_first
class MangaChapterModel {
  String title;
  String path;
  late String coverPath;

  MangaChapterModel({
    required this.title,
    required this.path,
  }) {
    coverPath = '$path/cover.png';
  }

  @override
  String toString() {
    return 'title => $title';
  }
}
