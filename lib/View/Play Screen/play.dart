import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/Provider/media%20provider.dart';
import 'package:provider/provider.dart';

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
final providerTrue = Provider.of<MediaProvider>(context);
    final providerFalse = Provider.of<MediaProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff0a1227),
      body:       Consumer<MediaProvider>(
        builder: (context, provider, child) => Padding(
          padding:
              EdgeInsets.only(left: w * 0.04, right: w * 0.04, top: w * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.01,
              ),
              Row(
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
                  Expanded(
                    child: Center(
                      child: Text(
                        'Playing Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: w * 0.06,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Container(
                width: w * 0.84,
                height: h * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: provider.musicModal!.data.results[providerTrue.selectedSong].image.length > 2
                      ? DecorationImage(
                          image: NetworkImage(provider.musicModal!.data.results[providerTrue.selectedSong].image[2].url),
                        )
                      : null,
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        provider.musicModal!.data.results[providerTrue.selectedSong].name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: w * 0.055,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        provider.musicModal!.data.results[providerTrue.selectedSong].artists.primary != null &&
                                provider.musicModal!.data.results[providerTrue.selectedSong].artists.primary!.isNotEmpty
                            ? provider.musicModal!.data.results[providerTrue.selectedSong].artists.primary![0].name
                            : 'Unknown Artist',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff768cbe),
                          fontSize: w * 0.05,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 49,),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: IconButton(onPressed: () {

                    }, icon: Icon(Icons.favorite_border,color: Colors.white,),),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
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
                    onPressed: () {
                      // provider.repeatSong();
                    },
                    icon: Icon(Icons.repeat,
                        color: Color(0xff768cbe), size: w * 0.076),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.shuffleSongs();
                    },
                    icon: Icon(Icons.shuffle,
                        color: Color(0xff768cbe), size: w * 0.076),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              StreamBuilder(
                stream: provider.getCurrentPosition(),
                builder: (context, snapshot) {
                  // Ensure duration is not null before using it
                  final duration = provider.duration;

                  if (duration == null) {
                    return SizedBox(); // Or handle this case as needed
                  }

                  return Slider(
                    max: duration.inSeconds.toDouble(),
                    value: (snapshot.data?.inSeconds.toDouble() ?? 0.0),
                    onChanged: (value) {
                      provider.jumpSong(Duration(seconds: value.toInt()));
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                  );
                },
              ),
              StreamBuilder(
                stream: provider.getCurrentPosition(),
                builder: (context, snapshot) {
                  final currentPosition = snapshot.data ?? Duration.zero;
                  final maxDuration = provider.duration ?? Duration.zero;

                  String formatDuration(Duration duration) {
                    String twoDigits(int n) => n.toString().padLeft(2, '0');
                    final minutes = twoDigits(duration.inMinutes.remainder(60));
                    final seconds = twoDigits(duration.inSeconds.remainder(60));
                    return "$minutes:$seconds";
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Add a null check for currentPosition before formatting
                        Text(
                          formatDuration(currentPosition),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: w * 0.04,
                          ),
                        ),
                        // Add a null check for maxDuration before formatting
                        Text(
                          formatDuration(maxDuration),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: w * 0.04,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

// Slider StreamBuilder

              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      provider.backSong();
                    },
                    icon: Icon(
                      CupertinoIcons.backward_end,
                      color: Colors.white,
                      size: w * 0.12,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await provider.playSong();
                    },
                    icon: provider.isPlay
                          ? Icon(
                              CupertinoIcons.pause,
                              color: Colors.white,
                              size: w * 0.12,
                            )
                          : Icon(
                              CupertinoIcons.play,
                              color: Colors.white,
                              size: w * 0.12,
                            ),
                    ),
                  IconButton(
                    onPressed: () {
                      provider.forwardSong();
                    },
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
