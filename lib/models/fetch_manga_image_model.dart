class FetchMangaImageModel {
  String title;
  String url;
  String coverUrl;
  bool isExists;
  FetchMangaImageModel({
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
