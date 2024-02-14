import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  static String id = 'VideoPage';
  final String? videoUrl;

  const VideoPage({super.key,  this.videoUrl});

  @override
  State<VideoPage> createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl!);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        captionLanguage: "ar",
        showLiveFullscreenButton: true,
        useHybridComposition: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    log('VideoPageState disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              orientation == Orientation.portrait
                  ? Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/videowallpaper.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : const Text(''),
              Center(
                child: YoutubePlayer(
                  controller: _controller,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
