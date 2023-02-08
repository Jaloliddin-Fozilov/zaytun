import 'package:flutter/material.dart';
import 'package:zaytun/models/flat_model.dart';

class RoomItem extends StatelessWidget {
  final FlatModel flat;
  final Function() function;
  const RoomItem({
    Key? key,
    required this.flat,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.greenAccent, Colors.white, Colors.yellow];

    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10),
        alignment: Alignment.center,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: colors[flat.status],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              flat.amountOfRooms != null
                  ? flat.amountOfRooms.toString()
                  : 0.toString(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              '${flat.capacity != null ? flat.capacity : 0} м²',
              style: const TextStyle(color: Colors.black, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
