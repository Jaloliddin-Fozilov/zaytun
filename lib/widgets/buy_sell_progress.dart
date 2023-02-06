import 'package:flutter/material.dart';
import 'package:zaytun/services/calcProgress.dart';

class BuySellProgress extends StatelessWidget {
  final String title;
  final int total;
  final int booked;
  final int free;
  const BuySellProgress({
    required this.title,
    required this.total,
    required this.booked,
    required this.free,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          minHeight: 7,
          value: calculateProgress(total, booked),
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
              '$booked м²',
              style: const TextStyle(fontSize: 23, color: Colors.orange),
            ),
            const Text(
              '|',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$free м²',
              style: const TextStyle(fontSize: 23, color: Colors.green),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
