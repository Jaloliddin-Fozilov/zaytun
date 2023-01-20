import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/providers/building_provider.dart';
import 'package:zaytun/screens/room_details.dart';
import 'package:zaytun/services/get_color_status.dart';
import 'package:zaytun/widgets/room_item.dart';

class StoreyDetails extends StatelessWidget {
  final int number;
  const StoreyDetails(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    final buildingProvider = Provider.of<BuildingProvider>(context).list[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BACKGROUNDCOLOR,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          iconSize: 20,
        ),
        title: Text(
          '$number этаж, Башня М1',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Image.asset('assets/images/etaj.png'),
              const SizedBox(height: 30),
              const Text(
                'Выберите квартиру',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  itemCount: buildingProvider.rooms.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) => RoomItem(
                    number: buildingProvider.rooms[i].number,
                    place: buildingProvider.rooms[i].place,
                    color: getColorByStatus(buildingProvider.rooms[i].status),
                    function: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (ctx) => RoomDetails(
                          storey: number,
                          room: buildingProvider.rooms[i],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
