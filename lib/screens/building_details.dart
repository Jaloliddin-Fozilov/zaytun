import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/widgets/buy_sell_progress.dart';

class BuildingDetails extends StatelessWidget {
  final String homeId;
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
            Image.asset(home.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  BuySellProgress(
                    title: 'Башня М1 | Жилая площадь',
                    total: 33000,
                    sell: 26100,
                  ),
                  SizedBox(height: 20),
                  BuySellProgress(
                    title: 'Башня М1  | Коммерческая площадь',
                    total: 5500,
                    sell: 5200,
                  ),
                  SizedBox(height: 20),
                  BuySellProgress(
                    title: 'Башня М2 | Жилая площадь',
                    total: 33000,
                    sell: 26100,
                  ),
                  SizedBox(height: 20),
                  BuySellProgress(
                    title: 'Башня М2  | Коммерческая площадь',
                    total: 5500,
                    sell: 5200,
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
