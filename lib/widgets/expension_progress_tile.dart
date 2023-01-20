import 'package:flutter/material.dart';
import 'package:zaytun/services/calcProgress.dart';

class ExpensionProgressTile extends StatelessWidget {
  final String title;
  final int total;
  final int sell;
  const ExpensionProgressTile(this.title, this.total, this.sell, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      backgroundColor: const Color(0xff16253F),
      collapsedBackgroundColor: const Color(0xff16253F),
      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
      childrenPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      textColor: Colors.white,
      children: [
        const SizedBox(height: 10),
        LinearProgressIndicator(
          minHeight: 7,
          value: calculateProgress(total, sell),
          backgroundColor: Colors.grey,
          color: Colors.greenAccent,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$total м²',
              style: const TextStyle(fontSize: 23),
            ),
            const Text(
              '|',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$sell м²',
              style: const TextStyle(fontSize: 23, color: Colors.orange),
            ),
            const Text(
              '|',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${total - sell} м²',
              style: const TextStyle(fontSize: 23, color: Colors.green),
            ),
          ],
        ),
      ],
    );
  }
}
