import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/models/flat_model.dart';
import 'package:zaytun/providers/auth_provider.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/screens/home_page.dart';
import 'package:zaytun/widgets/image_loading.dart';

class RoomDetails extends StatelessWidget {
  final int storey;
  final String towerName;
  final FlatModel flat;
  final int complexId;
  const RoomDetails({
    super.key,
    required this.storey,
    required this.towerName,
    required this.flat,
    required this.complexId,
  });

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
          '$storey этаж, $towerName, ${flat.capacity} м²',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ImageLoading(url: flat.image),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Площадь: ${flat.capacity} м²',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            ' ',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Цена м2: ${flat.priceM}\$',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Стоимость: ${flat.price}\$',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  flat.status == 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                final token = Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .token;
                                await Provider.of<HomeProvider>(context,
                                        listen: false)
                                    .bookingOrder(flat, complexId, token)
                                    .then((statusCode) {
                                  if (statusCode == 200) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text(
                                          'Успешно забронирован',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: const Text(
                                                'Хорошо',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ))
                                        ],
                                      ),
                                    );
                                  }
                                });

                                // Go to booking form
                                // Navigator.of(context).push(
                                //   CupertinoPageRoute(
                                //     builder: (ctx) => BookingForm(
                                //       flat: flat,
                                //       storey: storey,
                                //       towerName: towerName,
                                //     ),
                                //   ),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber),
                              child: const Text('Забронировать'),
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: flat.status == 1
                                    ? Colors.amber
                                    : Colors.blue[800],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                flat.owner,
                                style: TextStyle(
                                    color: flat == 1
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(flat.status == 1
                                ? 'Бронь до: ${DateFormat.yMd().format(flat.bookingTime)}'
                                : 'Договор: ${flat.contract}')
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
