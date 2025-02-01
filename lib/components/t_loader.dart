import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TLoader extends StatelessWidget {
  double size;
  Color? color;
  TLoader({
    super.key,
    this.size = 50,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // final themeProvider = context.watch<ThemeProvider>();
    final brightness = MediaQuery.of(context).platformBrightness;
    return SpinKitFadingCircle(
      size: size,
      color: brightness == Brightness.dark ? Colors.white : Colors.black,
    );
  }
}
