import 'package:flutter/rendering.dart';
import 'package:zaytun/models/floor_model.dart';

class EntrancesModel {
  final int id;
  final int number;
  final String image;
  final Color color;
  List<FloorsModel>? floors;

  EntrancesModel({
    required this.id,
    required this.number,
    required this.image,
    required this.color,
    this.floors,
  });
}
