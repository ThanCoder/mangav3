import 'package:flutter/material.dart';

class MyImageUrl extends StatelessWidget {
  String url;
  String defaultAssetsPath;
  BoxFit fit;
  MyImageUrl({
    super.key,
    required this.url,
    this.defaultAssetsPath = '',
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // return Image.asset(
    //     'assets/online.webp',
    //     fit: fit,
    //   );
  }
}
