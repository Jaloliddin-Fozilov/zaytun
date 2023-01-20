import 'package:flutter/material.dart';
import 'package:zaytun/data/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zaytun/screens/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final tabs = [
    const HomeTab(),
    const Center(
      child: Text('Шахматка'),
    ),
    const Center(
      child: Text('Клиенты'),
    ),
    const Center(
      child: Text('Отчеты'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CupertinoTabScaffold(
        backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
        tabBar: CupertinoTabBar(
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          backgroundColor: const Color(0xff121212),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          height: 50,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              label: 'Списания',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/chease.svg'),
              label: 'Шахматка',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/peoples.svg'),
              label: 'Клиенты',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/document_box.svg'),
              label: 'Отчеты',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return tabs[currentIndex];
            },
          );
        },
      ),
    );
  }
}
