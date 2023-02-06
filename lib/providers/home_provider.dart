import 'dart:convert';

import 'package:flutter/material.dart';
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
      final data = jsonDecode(response.body);
      final listData = data['data'] as List;
      List<HomeModel> loadedList = [];
      listData.forEach((building) {
        var towers = building['towers'] as List;

        loadedList.add(
          HomeModel(
            id: building['id'],
            title: building['name'],
            imageUrl: building['image'],
            address: building['address'],
            towers: towers
                .map(
                  (tower) => Tower(
                    id: tower['id'],
                    name: tower['name'],
                    totalArea: tower['total_area'],
                    freeArea: tower['free_area'],
                    bookedArea: tower['booked_area'],
                    floors: [FloorModel(id: 0)],
                  ),
                )
                .toList(),
          ),
        );
      });
      _list = loadedList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
