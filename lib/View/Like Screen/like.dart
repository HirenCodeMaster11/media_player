import 'package:flutter/material.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color(0xff0a1227),
      body: Padding(
        padding:
            EdgeInsets.only(left: w * 0.04, right: w * 0.04, top: w * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    size: w * 0.08,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.tune,
                    size: w * 0.08,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              'Liked Songs',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: w * 0.066),
            ),
            SizedBox(
              height: h * 0.024,
            ),
            Wrap(
              children: [
                Container(
                  height: h * 0.3,
                  width: w * 0.44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        width: w * 0.44,
                        height: h * 0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16)),
                        ),
                      ),
                      Text(
                        'Hiren H.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Hiren H.',
                        style: TextStyle(
                            color: Color(0xff768cbe),
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w * 0.04,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
