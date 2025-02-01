// ignore_for_file: public_member_api_docs, sort_constructors_first
class FetchConfigModel {
  String title;
  String url;
  String initUrl;
  String queryMangaList;
  String queryMangaPageList;
  String queryChapterList;
  String replaceListUrl;
  FetchConfigModel({
    required this.title,
    required this.url,
    required this.initUrl,
    required this.queryMangaList,
    required this.queryMangaPageList,
    required this.queryChapterList,
    required this.replaceListUrl,
  });

  factory FetchConfigModel.fromJson(Map<String, dynamic> map) {
    return FetchConfigModel(
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      initUrl: map['init_url'] ?? '',
      queryMangaList: map['query_manga_list'] ?? '',
      queryMangaPageList: map['query_manga_page_list'] ?? '',
      queryChapterList: map['query_chapter_list'] ?? '',
      replaceListUrl: map['replace_list_url'] ?? '',
    );
  }

  @override
  String toString() {
    return "title => $title";
  }
}
