import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/models/home_model.dart';
import 'package:zaytun/models/tower_model.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/screens/storey_details.dart';
import 'package:zaytun/widgets/custom_checkbox.dart';
import 'package:zaytun/widgets/expension_progress_tile.dart';
import 'package:zaytun/widgets/room_item.dart';

class BuildingPlaning extends StatefulWidget {
  final int homeId;
  const BuildingPlaning(this.homeId, {super.key});

  @override
  State<BuildingPlaning> createState() => _BuildingPlaningState();
}

class _BuildingPlaningState extends State<BuildingPlaning> {
  bool initVisit = true;
  late HomeModel home;
  late Tower tower;
  int entrance = 0;

  @override
  void didChangeDependencies() {
    if (initVisit) {
      home = Provider.of<HomeProvider>(context).getHomeById(widget.homeId);
      tower = home.towers[0];
      initVisit = false;
    }
    super.didChangeDependencies();
  }

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
        title: const Text(
          'Планировки',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(12),
            height: 20,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Визуально',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const ExpensionProgressTile(
                      'Доступная жилая площадь', 66000, 56100),
                  const SizedBox(height: 10),
                  const ExpensionProgressTile(
                      'Доступная коммерческая площадь', 5500, 5200),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Башня',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: home.towers
                                .map(
                                  (tower) => CustomCheckBox(
                                    '${tower.name[6]}${tower.name[7]}',
                                    true,
                                    Colors.greenAccent,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Подъезд',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: tower.entrances.map((entrance) {
                              return CustomCheckBox(
                                entrance.number.toString(),
                                true,
                                entrance.color,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: const Color(0xff16253F),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(180),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text('Свободно'),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(180),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text('Бронь'),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(180),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text('Продано'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemCount: tower.entrances[entrance].floors!.length,
                        itemBuilder: (ctx, i) {
                          final floor = tower.entrances[entrance].floors![i];
                          return Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                child: Text((i + 1).toString()),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: floor.flats.map(
                                    (flat) {
                                      List<Color> colors = [
                                        Colors.white,
                                        Colors.greenAccent,
                                        Colors.yellow
                                      ];
                                      return RoomItem(
                                        number: flat.amountOfRooms,
                                        place: flat.capacity != null
                                            ? flat.capacity
                                            : 0.0,
                                        color: colors[
                                            Random().nextInt(colors.length)],
                                        function: () => Navigator.of(context)
                                            .push(CupertinoPageRoute(
                                                builder: (ctx) =>
                                                    StoreyDetails(i + 1))),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
