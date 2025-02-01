import 'dart:convert';
import 'dart:io';

import 'package:manga_v3/models/fetch_config_model.dart';
import 'package:manga_v3/utils/path_util.dart';

List<FetchConfigModel> getFetchConfigList() {
  List<FetchConfigModel> list = [];
  final file = File('${getConfigPath()}/fetch_list.json');
  if (!file.existsSync()) return [];
  List<dynamic> res = jsonDecode(file.readAsStringSync());
  list = res.map((f) => FetchConfigModel.fromJson(f)).toList();

  return list;
}
