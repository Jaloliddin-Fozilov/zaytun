import 'package:zaytun/models/entrances_model.dart';

class Tower {
  final int id;
  final String name;
  final int totalArea;
  final int freeArea;
  final int bookedArea;
  final List<EntrancesModel> entrances;

  Tower({
    required this.id,
    required this.name,
    required this.totalArea,
    required this.freeArea,
    required this.bookedArea,
    required this.entrances,
  });
}
