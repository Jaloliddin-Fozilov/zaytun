import 'package:zaytun/models/room_model.dart';

class BuildingModel {
  final String id;
  final String name;
  final int entrances;
  final int storeys;

  final List<RoomModel> rooms;

  BuildingModel({
    required this.id,
    required this.name,
    required this.entrances,
    required this.storeys,
    required this.rooms,
  });
}
