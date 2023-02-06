import 'package:zaytun/models/tower_model.dart';

class HomeModel {
  final int id;
  final String title;
  final String imageUrl;
  final String address;
  final List<Tower> towers;

  HomeModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.address,
    required this.towers,
  });
}
