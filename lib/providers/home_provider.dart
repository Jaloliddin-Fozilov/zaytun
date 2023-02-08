import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zaytun/models/entrances_model.dart';
import 'package:zaytun/models/flat_model.dart';
import 'package:zaytun/models/floor_model.dart';
import 'package:zaytun/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:zaytun/models/tower_model.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> _list = [];

  List<HomeModel> get list {
    return [..._list];
  }

  HomeModel getHomeById(int id) {
    return _list.firstWhere((home) => home.id == id);
  }

  var errorr;

  Future<void> getDataComplexas() async {
    final url = Uri.parse('http://zaytun.matrixfitness.uz/api/getComplexes');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      print('${response.statusCode}\n${response.body}');
      getDataComplexas();
    }

    var data = jsonDecode(response.body);
    final listData = data['data'] as List;
    List<HomeModel> loadedList = [];
    await Future.delayed(Duration.zero).then(
      (_) => listData.forEach(
        (building) {
          var towers = building['towers'] as List;

          loadedList.add(
            HomeModel(
              id: building['id'],
              title: building['name'],
              imageUrl: building['image'],
              address: building['address'],
              towers: towers.map(
                (tower) {
                  List<EntrancesModel> entrances = [];
                  tower['entrances'].forEach(
                    (entrance) {
                      List<FloorsModel> floors = [];
                      entrance['floors'].forEach(
                        (floor) {
                          List<FlatModel> flats = [];
                          floor['flats'].forEach((flat) {
                            flats.add(
                              FlatModel(
                                id: flat['id'],
                                owner: flat['owner'],
                                contract: flat['contract'],
                                amountOfRooms: flat['amountOfRooms'] != null
                                    ? int.parse(flat['amountOfRooms'])
                                    : 0,
                                square: flat['square'],
                                capacity: flat['capacity'],
                                priceM: flat['priceM'],
                                price: flat['price'],
                                status: flat['status'],
                                bookingTime: flat['bookingTime'],
                                image: flat['image'],
                                fotoGallary: flat['fotoGallary'],
                              ),
                            );
                          });
                          floors.add(
                            FloorsModel(
                              id: floor['id'],
                              floor: int.parse(floor['floor']),
                              image: floor['image'],
                              flats: flats,
                            ),
                          );
                        },
                      );
                      return entrances.add(
                        EntrancesModel(
                          id: entrance['id'],
                          number: int.parse(entrance['number']),
                          image: entrance['image'],
                          color: Colors.greenAccent,
                          floors: floors,
                        ),
                      );
                    },
                  );
                  return Tower(
                    id: tower['id'],
                    name: tower['name'],
                    totalArea: tower['total_area'],
                    freeArea: tower['free_area'],
                    bookedArea: tower['booked_area'],
                    entrances: entrances,
                  );
                },
              ).toList(),
            ),
          );
        },
      ),
    );
    _list = loadedList;
    notifyListeners();
  }
}
