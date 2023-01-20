import 'package:flutter/material.dart';
import 'package:zaytun/models/home_model.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> _list = [
    HomeModel(
      id: '01',
      title: 'Modera Towers',
      imageUrl: 'assets/images/modera.png',
      address: 'Ташкент, ул. Шота Руставели, 19-2',
    ),
    HomeModel(
      id: '01',
      title: 'Modera Towers',
      imageUrl: 'assets/images/modera.png',
      address: 'Ташкент, ул. Шота Руставели, 19-2',
    ),
  ];

  List<HomeModel> get list {
    return [..._list];
  }

  HomeModel getHomeById(String id) {
    return _list.firstWhere((home) => home.id == id);
  }
}
