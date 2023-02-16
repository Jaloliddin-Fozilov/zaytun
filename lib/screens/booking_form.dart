import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/models/flat_model.dart';
import 'package:zaytun/providers/auth_provider.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/screens/treaty.dart';

class BookingForm extends StatefulWidget {
  final FlatModel flat;
  final int complexId;
  final int storey;

  final String towerName;
  const BookingForm(
      {super.key,
      required this.flat,
      required this.complexId,
      required this.storey,
      required this.towerName});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String phone = '';

  void _submit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    await Provider.of<HomeProvider>(context, listen: false)
        .bookingOrder(widget.flat, widget.complexId, name, phone)
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
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        );
      }
    });
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
        title: Text(
          '29-12/22-РС от ${DateFormat.yMd().format(DateTime.now())}',
          style: const TextStyle(color: Colors.white),
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
                '${widget.storey} этаж, ${widget.towerName}, ${widget.flat.capacity} м²',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Стоимость: ${widget.flat.price}\$',
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ФИО',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Поле не должно быть пустым';
                          }
                        }),
                    const SizedBox(height: 15),
                    const Text(
                      'Номер телефона',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onChanged: (value) => {
                        setState(() {
                          phone = value;
                        })
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите ваш номер телефона';
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            _submit();
                            // go to orders
                            //  Navigator.of(context).push(
                            //   CupertinoPageRoute(
                            //     builder: (ctx) => Treaty(
                            //       room: widget.flat,
                            //       storey: widget.storey,
                            //     ),
                            //   ),
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: const Text('Забронировать'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
