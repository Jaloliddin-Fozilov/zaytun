import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Color color;
  const CustomCheckBox(this.text, this.isChecked, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        border: isChecked
            ? Border.all(color: Colors.white, width: 2)
            : Border.all(color: Colors.grey, width: 2),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
