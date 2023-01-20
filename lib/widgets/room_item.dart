import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {
  final int number;
  final double place;
  final Color color;
  final Function() function;
  const RoomItem({
    Key? key,
    required this.number,
    required this.place,
    required this.color,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10),
        alignment: Alignment.center,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              number.toString(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              '$place м²',
              style: const TextStyle(color: Colors.black, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
