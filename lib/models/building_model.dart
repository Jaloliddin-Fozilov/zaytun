import 'package:zaytun/models/flat_model.dart';

class BuildingModel {
  final String id;
  final String name;
  final int entrances;
  final int storeys;

  final List<FlatModel> rooms;

  BuildingModel({
    required this.id,
    required this.name,
    required this.entrances,
    required this.storeys,
    required this.rooms,
  });
}
