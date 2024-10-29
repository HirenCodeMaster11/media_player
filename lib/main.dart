import 'package:flutter/material.dart';
import 'package:media_player/Provider/media%20provider.dart';
import 'package:media_player/View/Home%20Page/home.dart';
import 'package:media_player/View/Like%20Screen/like.dart';
import 'package:media_player/View/Splash/splash.dart';
import 'package:provider/provider.dart';

import 'View/Play Screen/play.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MediaProvider(), // Replace with your model class
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(), // Uncomment if you want to use this
          '/home': (context) => HomePage(),
          '/play': (context) => PlayScreen(),
          '/like': (context) => LikedScreen(),
        },
      ),
    );
  }
}
