import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/providers/auth_provider.dart';
import 'package:zaytun/screens/home_page.dart';
import 'package:zaytun/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? login = prefs.getString('login');
      String? password = prefs.getString('password');
      if (login != null &&
          login.isNotEmpty &&
          password != null &&
          password.isNotEmpty) {
        await Provider.of<AuthProvider>(context, listen: false)
            .authLogin(login, password);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => false);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 300,
            ),
          ),
          const Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Text(
              'Мы смотрим в будущее!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
