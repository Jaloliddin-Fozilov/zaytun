import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/providers/building_provider.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/screens/storey_details.dart';
import 'package:zaytun/services/calcProgress.dart';
import 'package:zaytun/widgets/custom_checkbox.dart';
import 'package:zaytun/widgets/expension_progress_tile.dart';
import 'package:zaytun/widgets/room_item.dart';

class BuildingPlaning extends StatelessWidget {
  final int homeId;
  const BuildingPlaning(this.homeId, {super.key});

  @override
  Widget build(BuildContext context) {
    final buildingProvider = Provider.of<BuildingProvider>(context);
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
                            children: const [
                              CustomCheckBox('M1', true, Colors.greenAccent),
                              SizedBox(width: 5),
                              CustomCheckBox('M2', false, Colors.greenAccent),
                            ],
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
                          Row(children: const [
                            CustomCheckBox('1', true, Colors.greenAccent),
                            SizedBox(width: 5),
                            CustomCheckBox('2', false, Colors.orange),
                            SizedBox(width: 5),
                            CustomCheckBox('3', true, Colors.orange),
                            SizedBox(width: 5),
                            CustomCheckBox('4', true, Colors.greenAccent),
                            SizedBox(width: 5),
                            CustomCheckBox('5', true, Colors.greenAccent),
                          ]),
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
                        itemCount: buildingProvider.list[0].storeys,
                        itemBuilder: (ctx, i) {
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
                                  children: buildingProvider.list[0].rooms.map(
                                    (e) {
                                      List<Color> colors = [
                                        Colors.white,
                                        Colors.greenAccent,
                                        Colors.yellow
                                      ];
                                      return RoomItem(
                                        number: e.number,
                                        place: e.place,
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
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
