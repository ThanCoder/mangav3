// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppConfigModel {
  bool isUseCustomPath;
  String customPath;

  AppConfigModel({
    required this.isUseCustomPath,
    required this.customPath,
  });

  factory AppConfigModel.fromJson(Map<String, dynamic> map) {
    return AppConfigModel(
      isUseCustomPath: map['is_use_custom_path'] ?? '',
      customPath: map['custom_path'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        'is_use_custom_path': isUseCustomPath,
        'custom_path': customPath,
      };
}
