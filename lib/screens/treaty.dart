import 'package:flutter/material.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/models/flat_model.dart';

class Treaty extends StatelessWidget {
  final FlatModel room;
  final int storey;
  Treaty({super.key, required this.room, required this.storey});

  List<Map<String, dynamic>> history = [
    {
      'amount_payment': {
        'payment': '47 261',
        'date': '01.01.2023',
      },
      'remainder': '47 261',
      'status': 'оплачен',
    },
    {
      'amount_payment': {
        'payment': '47 261',
        'date': '01.01.2023',
      },
      'remainder': '47 261',
      'status': 'оплачен',
    },
    {
      'amount_payment': {
        'payment': '47 261',
        'date': '01.01.2023',
      },
      'remainder': '47 261',
      'status': '',
    },
    {
      'amount_payment': {
        'payment': '47 261',
        'date': '01.01.2023',
      },
      'remainder': '47 261',
      'status': '',
    },
    {
      'amount_payment': {
        'payment': '47 261',
        'date': '01.01.2023',
      },
      'remainder': '47 261',
      'status': '',
    }
  ];

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
          '29-12/22-РС от 01-12-22',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                '$storey этаж, Башня М1, ${0} / ${0} м²',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Стоимость: ${2900}\$',
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'График платежей',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Срок погашения 6 месяцев',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                        (states) {
                          return const Color(0xffF3F5F7);
                        },
                      ),
                      dataTextStyle: const TextStyle(color: Color(0xff12154C)),
                      columns: const [
                        DataColumn(
                            label: Text('Сумма платежа',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Остаток',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Статус',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold))),
                      ],
                      rows: history
                          .map(
                            (payment) => DataRow(
                              cells: [
                                DataCell(
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          payment['amount_payment']['payment']),
                                      Text(
                                        payment['amount_payment']['date'],
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(Text(payment['remainder'])),
                                DataCell(Text(
                                  payment['status'],
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
