import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/Provider/media%20provider.dart';
import 'package:media_player/modal/media%20modal.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDrawerOpen = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    final providerTrue = Provider.of<MediaProvider>(context);
    final providerFalse = Provider.of<MediaProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff0a1227),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: w * 0.04, right: w * 0.04, top: w * 0.03),
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
                        icon: Icon(Icons.menu, color: Colors.white),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: isExpanded ? w * 0.67 : 0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                          child: TextField(
                            controller: providerTrue.txtSearch,
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            onSubmitted: (value) {
                              providerFalse.searchSong(providerTrue.txtSearch.text);
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.white),
                              border: isExpanded
                                  ? OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xff768cba)),
                              )
                                  : OutlineInputBorder(borderSide: BorderSide.none),
                              focusedBorder: isExpanded
                                  ? OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xff768cba)),
                              )
                                  : OutlineInputBorder(borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Color(0xff768cba).withOpacity(0.2),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isExpanded ? Icons.close : Icons.search_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                            if (!isExpanded) {
                              providerTrue.txtSearch.clear(); // Clear text when collapsed
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.01),
                  Text(
                    'Recommended for you',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: w * 0.06),
                  ),
                  SizedBox(height: h * 0.02),
                  Provider.of<MediaProvider>(context).musicModal == null
                      ? Center(child: CircularProgressIndicator())
                      : Consumer<MediaProvider>(
                    builder: (context, provider, child) => GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: 0.75,
                      ),
                      physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                      shrinkWrap: true,
                      itemCount: provider.musicModal?.data.results.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            provider.selectSong(index);
                            provider.setSong(provider.musicModal!.data.results[index].downloadUrl[1].url);
                            Navigator.of(context).pushNamed('/play');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: h * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      topLeft: Radius.circular(16),
                                    ),
                                    image: provider.musicModal!.data.results[index].image.length > 2
                                        ? DecorationImage(
                                      image: NetworkImage(provider.musicModal!.data.results[index].image[2].url),
                                      fit: BoxFit.cover,
                                    )
                                        : null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.musicModal?.data.results[index].name ?? 'Unknown Song',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: w * 0.044,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        provider.musicModal?.data.results[index].artists.primary?.isNotEmpty == true
                                            ? provider.musicModal!.data.results[index].artists.primary![0].name
                                            : 'Unknown Artist',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Color(0xff768cbe),
                                          fontSize: w * 0.04,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: isDrawerOpen ? 0 : -w * 0.7,
            top: 0,
            bottom: 0,
            child: Container(
              width: w * 0.7,
              color: Color(0xff0a1227),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.018),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.02),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close, color: Colors.white, size: w * 0.08),
                    ),
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.person, color: Color(0xff768cbe)),
                    title: Text('Profile', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Profile tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite_border, color: Color(0xff768cbe)),
                    title: Text('Liked Songs', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.of(context).pushNamed('like');
                    },
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.globe, color: Color(0xff768cbe)),
                    title: Text('Language', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Language tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.message_outlined, color: Color(0xff768cbe)),
                    title: Text('Contact Us', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Contact Us tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.lightbulb, color: Color(0xff768cbe)),
                    title: Text('FAQs', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle FAQs tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings_outlined, color: Color(0xff768cbe)),
                    title: Text('Settings', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Settings tap
                    },
                  ),
                ],
              ),
            ),
          ),
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
    );
  }


// Widget buildBottomNavigationBar(double w, double h) {
//   return Padding(
//     padding: const EdgeInsets.all(5.0),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Slider(
//           value: 1.42,
//           onChanged: (value) {},
//           min: 0,
//           max: 3,
//           activeColor: Colors.white,
//           inactiveColor: Colors.white24,
//         ),
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               height: h * 0.08,
//               width: w * 0.17,
//               decoration: BoxDecoration(
//                 color: Colors.amber,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             SizedBox(width: w * 0.03),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   width: w * 0.35,
//                   child: Text(
//                     'Chaff & Dust',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: w * 0.052,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: w * 0.35,
//                   child: Text(
//                     'HYONNA',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       color: Color(0xff768cbe),
//                       fontSize: w * 0.042,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(width: w * 0.01),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 CupertinoIcons.backward_end,
//                 color: Colors.white,
//                 size: w * 0.09,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 CupertinoIcons.pause,
//                 color: Colors.white,
//                 size: w * 0.09,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 CupertinoIcons.forward_end,
//                 color: Colors.white,
//                 size: w * 0.09,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
}
