import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/place_card.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  @override
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _videoPlayerController;
  bool _videoInitialized = false; // A flag to track initialization

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/CairoTimeLapse.mp4')
          ..initialize().then((_) {
            setState(() {
              _videoInitialized = true;
            });
          }).catchError((error) {
            print('Error during video initialization: $error');
          });

    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _videoInitialized && _videoPlayerController.value.isInitialized
              ? SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        width: _videoPlayerController.value.size.width,
                        height: _videoPlayerController.value.size.height,
                        child: VideoPlayer(_videoPlayerController),
                      ),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
          Container(
            height: 100.h,
            width: 100.w,
            decoration:
                const BoxDecoration(color: Color.fromARGB(50, 255, 189, 35)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tourista",
                            style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2.0
                                ..color = Colors.black,
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 2.0,
                                    color: Colors.white),
                              ],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Image.asset(
                            "assets/pyramids.png",
                            height: 10.h,
                          )
                        ],
                      ),
                      Text(
                        "Explore fun historical places in the city.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.0
                            ..color = Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 2.0,
                                color: Color.fromARGB(255, 235, 190, 10)),
                          ],
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PlaceCard.id);
                    },
                    child: Container(
                      width: 70.w,
                      height: 8.h,
                      margin: EdgeInsets.only(bottom: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 235, 190, 10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Explore now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Image.asset('assets/tourist.png')
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
