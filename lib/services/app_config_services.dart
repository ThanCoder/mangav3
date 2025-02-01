import 'dart:convert';
import 'dart:io';

import 'package:manga_v3/models/app_config_model.dart';
import 'package:manga_v3/notifier/app_notifier.dart';

Future<void> initAppConfig() async {
  final config = getConfigFile();
  //custom path
  if (config.isUseCustomPath && config.customPath.isNotEmpty) {
    rootPathNotifier.value = config.customPath;
  }
}

AppConfigModel getConfigFile() {
  final file = File(configPathNotifier.value);
  if (!file.existsSync()) {
    return AppConfigModel(isUseCustomPath: false, customPath: '');
  }
  return AppConfigModel.fromJson(jsonDecode(file.readAsStringSync()));
}

void setConfigFile(AppConfigModel appConfig) {
  final file = File(configPathNotifier.value);
  file.writeAsStringSync(jsonEncode(appConfig.toJson()));
}
