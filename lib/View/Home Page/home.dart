import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDrawerOpen = false; // State to track if the drawer is open

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Color(0xff0a1227),
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: w * 0.03, right: w * 0.03, top: w * 0.03),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDrawerOpen = !isDrawerOpen; // Toggle drawer state
                          });
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.01),
                  Text(
                    'Recommended for you',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: w * 0.066),
                  ),
                  SizedBox(height: h * 0.02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildRecommendationContainer(w, h),
                        buildRecommendationContainer(w, h),
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.03),
                  Text(
                    'My Playlist',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: w * 0.066),
                  ),
                  SizedBox(height: h * 0.02),
                  buildPlaylistContainer(w, h),
                ],
              ),
            ),
          ),
          // Custom Drawer
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: isDrawerOpen ? 0 : -w * 0.7,
            // Adjust drawer position
            top: 0,
            bottom: 0,
            child: Container(
              width: w * 0.7,
              color: Color(0xff0a1227),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h*0.018,),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.02),
                    child: IconButton(onPressed: () {
                      Navigator.of(context).pop();
                    },icon : Icon(Icons.close,color: Colors.white,size: w*0.08,),),
                  ),
                  ListTile(
                    leading:
                        Icon(CupertinoIcons.person, color: Color(0xff768cbe)),
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle Profile tap
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.favorite_border, color: Color(0xff768cbe)),
                    title: Text(
                      'Liked Songs',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle Liked Songs tap
                    },
                  ),
                  ListTile(
                    leading:
                    Icon(CupertinoIcons.globe, color: Color(0xff768cbe)),
                    title: Text(
                      'Language',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle Liked Songs tap
                    },
                  ),
                  ListTile(
                    leading:
                    Icon(Icons.message_outlined, color: Color(0xff768cbe)),
                    title: Text(
                      'Contact Us',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle Liked Songs tap
                    },
                  ),
                  ListTile(
                    leading:
                    Icon(Icons.lightbulb, color: Color(0xff768cbe)),
                    title: Text(
                      'FAQs',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle Liked Songs tap
                    },
                  ),
                  ListTile(
                    leading:
                    Icon(Icons.settings_outlined, color: Color(0xff768cbe)),
                    title: Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Handle Liked Songs tap
                    },
                  ),
                ],
              ),
            ),
          ),
          // Drawer backdrop (optional)
          if (isDrawerOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  isDrawerOpen = false; // Close drawer when backdrop is tapped
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.1), // Backdrop color
              ),
            ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(w, h),
    );
  }

  Widget buildRecommendationContainer(double w, double h) {
    return Container(
      height: h * 0.28,
      width: w * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            width: w * 0.46,
            height: h * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16)),
              // Add image or other content here
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
          )
        ],
      ),
    );
  }

  Widget buildPlaylistContainer(double w, double h) {
    return Container(
      height: h * 0.28,
      width: w * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            width: w * 0.46,
            height: h * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16)),
              // Add image or other content here
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
          )
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar(double w, double h) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            value: 1.42,
            onChanged: (value) {},
            min: 0,
            max: 3,
            activeColor: Colors.white,
            inactiveColor: Colors.white24,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: h * 0.08,
                width: w * 0.17,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: w * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: w * 0.35,
                    child: Text(
                      'Chaff & Dust',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: w * 0.052,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.35,
                    child: Text(
                      'HYONNA',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff768cbe),
                        fontSize: w * 0.042,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: w * 0.01),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.backward_end,
                  color: Colors.white,
                  size: w * 0.09,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.pause,
                  color: Colors.white,
                  size: w * 0.09,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.forward_end,
                  color: Colors.white,
                  size: w * 0.09,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
