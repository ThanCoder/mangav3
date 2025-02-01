// ignore_for_file: public_member_api_docs, sort_constructors_first
class FetchMangaChapterModel {
  String title;
  String url;
  String coverUrl;
  bool isExists;
  FetchMangaChapterModel({
    required this.title,
    required this.url,
    required this.coverUrl,
    this.isExists = false,
  });

  @override
  String toString() {
    return "\ntitle => $title \nurl => $url\ncoverUrl => $coverUrl\n==========";
  }
}
