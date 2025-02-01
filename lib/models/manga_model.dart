// ignore_for_file: public_member_api_docs, sort_constructors_first
class MangaModel {
  String title;
  String path;
  int date;
  late String coverPath;
  MangaModel({
    required this.title,
    required this.path,
    required this.date,
  }) {
    coverPath = '$path/cover.png';
  }

  @override
  String toString() {
    return "title: $title <=> path: $path";
  }
}
