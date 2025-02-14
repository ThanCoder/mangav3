import 'package:flutter/material.dart';

class TChip extends StatelessWidget {
  String text;
  Color bgColor;
  Color textColor;
  void Function()? onClicked;
  TChip({
    super.key,
    required this.text,
    this.bgColor = Colors.teal,
    this.textColor = Colors.white,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClicked != null) {
          onClicked!();
        }
      },
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
