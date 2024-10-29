import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('/home');
    },);
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color(0xff0a1227),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/sp.png'),
            SizedBox(height: h*0.038,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('B',style: TextStyle(color: Color(0xffD91C2B),fontWeight: FontWeight.w500,fontSize: w*0.11,height: -w*0.0026),),
                Text('e',style: TextStyle(color: Color(0xffDE1D71),fontWeight: FontWeight.w500,fontSize: w*0.11,height: -w*0.0026),),
                Text('atB',style: TextStyle(color: Color(0xffF31EB1),fontWeight: FontWeight.w500,fontSize: w*0.11,height: -w*0.0026),),
                Text('o',style: TextStyle(color: Color(0xffC81CC2),fontWeight: FontWeight.w500,fontSize: w*0.11,height: -w*0.0026),),
                Text('x',style: TextStyle(color: Color(0xff671DF1),fontWeight: FontWeight.w500,fontSize: w*0.11,height: -w*0.0026),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
