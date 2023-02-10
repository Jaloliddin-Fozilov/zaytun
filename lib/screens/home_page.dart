import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/screens/building_planing.dart';
import 'package:zaytun/screens/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeTab(),
    );
  }
}
