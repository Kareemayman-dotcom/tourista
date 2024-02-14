import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  static String id = 'VideoPage';

  String videoUrl;
  VideoPage({super.key, required this.videoUrl});

  @override
  State<VideoPage> createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        captionLanguage: "ar",
        showLiveFullscreenButton: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/videowallpaper.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : Text(''),
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
