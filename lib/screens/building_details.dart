import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/widgets/buy_sell_progress.dart';
import 'package:zaytun/widgets/image_loading.dart';

class BuildingDetails extends StatelessWidget {
  final int homeId;
  const BuildingDetails(this.homeId, {super.key});

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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ImageLoading(url: home.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: home.towers
                    .map(
                      (tower) => BuySellProgress(
                        title: tower.name,
                        total: tower.totalArea,
                        booked: tower.bookedArea,
                        free: tower.freeArea,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
