import 'package:zaytun/models/flat_model.dart';

class FloorsModel {
  final int id;
  final int floor;
  final String image;
  final List<FlatModel> flats;

  FloorsModel({
    required this.id,
    required this.floor,
    required this.image,
    required this.flats,
  });
}
