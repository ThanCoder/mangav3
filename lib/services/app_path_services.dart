import 'dart:io';

import 'package:manga_v3/constants.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getAppPath() async {
  String res = "";
  if (Platform.isAndroid) {
    final dir = await getExternalStorageDirectory();
    res = dir!.path;
  } else if (Platform.isLinux) {
    res = '${Platform.environment["HOME"] ?? ""}/.$appName';
  }

  return res;
}

String getAppRootPath() {
  String res = "";
  if (Platform.isAndroid) {
    res = androidRootPath;
  } else if (Platform.isLinux) {
    res = Platform.environment["HOME"] ?? "";
  }

  return res;
}
