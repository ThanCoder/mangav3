import 'dart:io';

import 'package:manga_v3/notifier/app_notifier.dart';

String getBasename(String path) {
  return path.split('/').last;
}

String getRootPath() {
  return rootPathNotifier.value;
}

String getHomePath() {
  return createDir(rootPathNotifier.value);
}

String getConfigPath() {
  return createDir('${getHomePath()}/config');
}

String getLibaryPath() {
  return createDir('${getHomePath()}/libary');
}

String getSourcePath() {
  return createDir('${getHomePath()}/source');
}

String createDir(String path) {
  final dir = Directory(path);
  if (!dir.existsSync()) {
    dir.createSync();
  }
  return dir.path;
}
