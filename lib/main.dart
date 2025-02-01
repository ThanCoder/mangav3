import 'package:flutter/material.dart';
import 'package:manga_v3/app.dart';
import 'package:manga_v3/notifier/app_notifier.dart';
import 'package:manga_v3/services/app_config_services.dart';
import 'package:manga_v3/services/app_path_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //app path
  String rootPath = await getAppPath();
  rootPathNotifier.value = rootPath;
  configPathNotifier.value = '$rootPath/main.config';

  await initAppConfig();

  //desktop
  // await initDesktopConfig();

  runApp(const App());
}
