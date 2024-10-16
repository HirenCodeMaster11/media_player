import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Color(0xff0a1227),
      body: Padding(
        padding:
            EdgeInsets.only(left: w * 0.03, right: w * 0.03, top: w * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h*0.01,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      size: w * 0.08,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Playing Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: w * 0.062,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.04,),
              Container(
                height: h * 0.4,
                width: w * 0.84,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              // CarouselSlider.builder(
              //   itemCount: 4,
              //   options: CarouselOptions(),
              //   itemBuilder:
              //       (BuildContext context, int itemIndex, int pageViewIndex) =>
              //
              // ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_up_outlined,
                      color: Color(0xff768cbe),
                      size: w * 0.076,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.repeat,
                        color: Color(0xff768cbe), size: w * 0.076),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shuffle,
                        color: Color(0xff768cbe), size: w * 0.076),
                  ),
                ],
              ),
              Slider(
                value: 1.42,
                onChanged: (value) {},
                min: 0,
                max: 3,
                activeColor: Colors.white,
                inactiveColor: Colors.white24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.backward_end,
                      color: Colors.white,
                      size: w * 0.12,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.pause,
                      color: Colors.white,
                      size: w * 0.12,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.forward_end,
                      color: Colors.white,
                      size: w * 0.12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//alignment: Alignment.topCenter,
//                   child: Column(
//                     children: [
//                       Container(
//                         width: w * 0.46,
//                         height: h * 0.2,
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey,
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(16),
//                               topLeft: Radius.circular(16)),
//                           // image: DecorationImage(image: AssetImage('')),
//                         ),
//                       ),
//                       Text(
//                         'Hiren H.',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: w * 0.05,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         'Hiren H.',
//                         style: TextStyle(
//                             color: Color(0xff768cbe),
//                             fontSize: w * 0.045,
//                             fontWeight: FontWeight.w400),
//                       )
//                     ],
//                   ),