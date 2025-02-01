import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  Widget body;
  Widget? floatingActionButton;
  AppBar? appBar;
  double contentPadding;
  Widget? drawer;
  MyScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.appBar,
    this.drawer,
    this.contentPadding = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Padding(
        padding: EdgeInsets.all(contentPadding),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
