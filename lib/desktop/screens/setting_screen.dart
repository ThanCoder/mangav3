import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manga_v3/components/my_scaffold.dart';
import 'package:manga_v3/constants.dart';
import 'package:manga_v3/models/app_config_model.dart';
import 'package:manga_v3/notifier/app_notifier.dart';
import 'package:manga_v3/notifier/manga_notifer.dart';
import 'package:manga_v3/services/android_app_services.dart';
import 'package:manga_v3/services/app_config_services.dart';
import 'package:manga_v3/services/app_path_services.dart';
import 'package:manga_v3/utils/manga_util.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  bool isChanged = false;
  late AppConfigModel configFile;
  bool isUsedCustomPath = false;
  TextEditingController customPathTextController = TextEditingController();

  void init() async {
    configFile = getConfigFile();
    setState(() {
      isUsedCustomPath = configFile.isUseCustomPath;
      customPathTextController.text = configFile.customPath.isEmpty
          ? '${getAppRootPath()}/.$appName'
          : configFile.customPath;
    });
  }

  void _saveConfig() async {
    try {
      if (Platform.isAndroid) {
        if (!await checkStoragePermission()) {
          await requestStoragePermission();
          return;
        }
      }

      configFile.customPath = customPathTextController.text;
      configFile.isUseCustomPath = isUsedCustomPath;

      setConfigFile(configFile);
      if (isUsedCustomPath) {
        //change
        rootPathNotifier.value = configFile.customPath;
        mangaListNotifier.value = getMangaList();
      }

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Config ကိုသိမ်းဆည်းပြီးပါပြီ')));
      setState(() {
        isChanged = false;
      });
    } catch (e) {
      debugPrint('saveConfig: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: ListView(
        children: [
          //custom path
          _MyListTile(
            title: "custom path",
            desc: "သင်ကြိုက်နှစ်သက်တဲ့ path ကို ထည့်ပေးပါ",
            widget: Checkbox(
              value: isUsedCustomPath,
              onChanged: (value) {
                setState(() {
                  isUsedCustomPath = value!;
                  isChanged = true;
                });
              },
            ),
          ),
          isUsedCustomPath
              ? _MyListTile2(
                  widget1: TextField(
                    controller: customPathTextController,
                  ),
                  widget2: IconButton(
                    onPressed: () {
                      _saveConfig();
                    },
                    icon: const Icon(
                      Icons.save,
                    ),
                  ),
                )
              : Container(),
          const Divider(),
          //
        ],
      ),
      floatingActionButton: isChanged
          ? FloatingActionButton(
              onPressed: () {
                _saveConfig();
              },
              child: const Icon(Icons.save),
            )
          : null,
    );
  }
}

class _MyListTile2 extends StatelessWidget {
  Widget widget1;
  Widget widget2;
  String? desc;
  _MyListTile2({
    required this.widget1,
    required this.widget2,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget1,
                  desc != null ? const SizedBox(height: 5) : Container(),
                  desc != null
                      ? Text(
                          desc ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.white60,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            widget2,
          ],
        ),
      ),
    );
  }
}

class _MyListTile extends StatelessWidget {
  String title;
  String? desc;
  Widget widget;
  _MyListTile({
    required this.title,
    this.desc,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  desc != null ? const SizedBox(height: 5) : Container(),
                  desc != null
                      ? Text(
                          desc ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.white60,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
