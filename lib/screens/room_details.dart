import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/models/flat_model.dart';
import 'package:zaytun/screens/booking_form.dart';
import 'package:zaytun/services/get_color_status.dart';
import 'package:zaytun/widgets/image_loading.dart';

class RoomDetails extends StatelessWidget {
  final int storey;
  final String towerName;
  final FlatModel flat;
  const RoomDetails({
    super.key,
    required this.storey,
    required this.towerName,
    required this.flat,
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
          '$storey этаж, $towerName, ${0} / ${0} м²',
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
                            'Площадь: ${0} м²',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Жилая: ${0} м²',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Цена м2: 2 900\$',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Стоимость: ${2900}\$',
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
                              onPressed: () => Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (ctx) => BookingForm(
                                    room: flat,
                                    storey: storey,
                                  ),
                                ),
                              ),
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
                                'Клиент: Пономарев Д.С.',
                                style: TextStyle(
                                    color: flat == 1
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(flat.status == 1
                                ? 'Бронь до: 01.01.2023'
                                : 'Договор: 29-12/22-РС от 01-12-22 (рассрочка, 6 мес.)')
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
