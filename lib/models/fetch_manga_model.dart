// ignore_for_file: public_member_api_docs, sort_constructors_first
class FetchMangaModel {
  String title;
  String url;
  String coverUrl;
  FetchMangaModel({
    required this.title,
    required this.url,
    required this.coverUrl,
  });

  @override
  String toString() {
    return "\ntitle => $title \nurl => $url\ncoverUrl => $coverUrl\n==========";
  }
}
