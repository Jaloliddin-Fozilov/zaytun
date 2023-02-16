import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<void> getDataComplexas() async {
    final url = Uri.parse('http://zaytun.matrixfitness.uz/api/getComplexes');

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        print('${response.statusCode}\n${response.body}');
        getDataComplexas();
      }
      var data = jsonDecode(response.body);
      final listData = data['data'] as List;
      List<HomeModel> loadedList = [];
      listData.forEach(
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
                                owner: flat['owner'] ??
                                    '', // required field & cannot be null
                                contract: flat['contract'] ?? '',
                                amountOfRooms: flat['amountOfRooms'] != null
                                    ? int.parse(flat['amountOfRooms'])
                                    : 0,
                                square: flat['square'] ?? 0,
                                capacity: flat['capacity'] ?? 0,
                                priceM: flat['priceM'] ?? 0,
                                price: flat['price'] ?? 0,
                                status: flat['status'] ?? 0,
                                bookingTime:
                                    flat['bookingTime'] ?? DateTime.now(),
                                image: flat['image'] ??
                                    '/assets/images/modera.png',
                                fotoGallary: flat['fotoGallary'] ??
                                    ['/assets/images/modera.png'],
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
      );
      _list = loadedList;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> bookingOrder(
      FlatModel flat, int complexId, String phone, String name) async {
    final url = Uri.parse('http://zaytun.matrixfitness.uz/api/booking');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var headers = {'Authorization': 'Bearer $token'};
    final date =
        '${DateTime.now().year}.${DateTime.now().month}.${DateTime.now().day}';
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://zaytun.matrixfitness.uz/api/booking?complex_id=$complexId&contract=${0000}&date=$date&price=${flat.price}&id_of_flat=${flat.id}&type_id=${4}&manager_id=${3}?name=$name&phone=$phone'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return response.statusCode;
  }
}
