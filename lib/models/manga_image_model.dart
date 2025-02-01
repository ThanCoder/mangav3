// ignore_for_file: public_member_api_docs, sort_constructors_first
class MangaImageModel {
  String title;
  String path;
  MangaImageModel({
    required this.title,
    required this.path,
  });

  @override
  String toString() {
    return "title => $title";
  }
}
