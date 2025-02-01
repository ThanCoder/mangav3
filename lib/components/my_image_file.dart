import 'dart:io';

import 'package:flutter/material.dart';

class MyImageFile extends StatelessWidget {
  String path;
  String defaultAssetsPath;
  BoxFit fit;
  MyImageFile({
    super.key,
    required this.path,
    this.defaultAssetsPath = '',
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final file = File(path);
    if (file.existsSync()) {
      return Image.file(
        file,
        fit: fit,
      );
    } else {
      return Image.asset(
        'assets/online.webp',
        fit: fit,
      );
    }
  }
}
