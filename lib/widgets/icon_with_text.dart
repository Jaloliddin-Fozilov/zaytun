import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWithText extends StatelessWidget {
  final Function() function;
  final String icon;
  final String text;
  const IconWithText({
    required this.function,
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 50,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
