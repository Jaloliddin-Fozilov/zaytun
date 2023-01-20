import 'package:flutter/cupertino.dart';
import 'package:zaytun/models/building_model.dart';
import 'package:zaytun/models/room_model.dart';

class BuildingProvider with ChangeNotifier {
  List<BuildingModel> _list = [
    BuildingModel(
      id: 'm1',
      name: 'M1',
      entrances: 5,
      storeys: 24,
      rooms: [
        RoomModel(
            id: '01',
            number: 01,
            place: 52.8,
            residential: 42.10,
            status: 'sold'),
        RoomModel(
            id: '02',
            number: 02,
            place: 75.3,
            residential: 60.84,
            status: 'booking'),
        RoomModel(
            id: '03',
            number: 03,
            place: 86.3,
            residential: 73.28,
            status: 'free'),
        RoomModel(
          id: '04',
          number: 04,
          place: 146,
          residential: 116,
          status: 'sold',
        ),
        RoomModel(
          id: '05',
          number: 05,
          place: 209,
          residential: 190,
          status: 'free',
        ),
      ],
    ),
  ];

  List<BuildingModel> get list {
    return [..._list];
  }
}
