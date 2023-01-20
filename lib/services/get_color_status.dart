import 'package:flutter/material.dart';

Color getColorByStatus(String status) {
  if (status == 'free') {
    return Colors.greenAccent;
  } else if (status == 'booking') {
    return Colors.white;
  } else {
    return Colors.yellow;
  }
}
