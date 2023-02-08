import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/models/floor_model.dart';
import 'package:zaytun/screens/room_details.dart';
import 'package:zaytun/widgets/image_loading.dart';
import 'package:zaytun/widgets/room_item.dart';

class StoreyDetails extends StatelessWidget {
  final FloorsModel floor;
  final String towerName;
  final int complexId;
  const StoreyDetails(this.floor, this.towerName, this.complexId, {super.key});

  @override
  Widget build(BuildContext context) {
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
          '${floor.floor} этаж, $towerName',
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ImageLoading(url: floor.image),
              ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: floor.flats
                      .map(
                        (flat) => RoomItem(
                          flat: flat,
                          function: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (ctx) => RoomDetails(
                                storey: floor.floor,
                                towerName: towerName,
                                flat: flat,
                                complexId: complexId,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
