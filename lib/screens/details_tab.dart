import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/screens/building_details.dart';
import 'package:zaytun/screens/building_planing.dart';
import 'package:zaytun/widgets/icon_with_text.dart';
import 'package:zaytun/widgets/buy_sell_progress.dart';

class DetailsTab extends StatelessWidget {
  final String homeId;
  const DetailsTab(this.homeId, {super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final home = homeProvider.getHomeById(homeId);
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
          home.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(home.imageUrl),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color(0xff0D1B33).withOpacity(0.75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconWithText(
                              function: () => Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          BuildingPlaning(homeId)))),
                              icon: 'assets/icons/company.svg',
                              text: 'Планировки',
                            ),
                            IconWithText(
                              function: () => Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          BuildingDetails(homeId)))),
                              icon: 'assets/icons/document_box_big.svg',
                              text: 'Отчеты по ЖК',
                            ),
                            IconWithText(
                              function: () {},
                              icon: 'assets/icons/peoples.svg',
                              text: 'Клиенты',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  BuySellProgress(
                    title: 'Доступная жилая площадь',
                    total: 66000,
                    sell: 56100,
                  ),
                  SizedBox(height: 20),
                  BuySellProgress(
                    title: 'Доступная коммерческая площадь',
                    total: 12500,
                    sell: 11200,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
