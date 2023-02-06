import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zaytun/data/constants.dart';
import 'package:zaytun/providers/home_provider.dart';
import 'package:zaytun/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zaytun',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          cardColor: const Color(0xff222428),
          scaffoldBackgroundColor: BACKGROUNDCOLOR,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
