import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class PlaceCard extends StatefulWidget {
  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  static late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    Directory("assets/videos/").list().forEach((f) => print(f.path));

    _videoPlayerController =
        VideoPlayerController.asset('assets/CairoTimeLapse.mp4')
          ..initialize().then((_) {
            setState(() {});
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 218, 69),
      body: Stack(
        children: [
          SizedBox(
            height: 40.h,
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: _AppBarDelegate(
                  minHeight: 25.h,
                  maxHeight: 40.h,
                ),
              ),
              SliverList(
                // Use SliverList or other slivers for body content
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text("Item $index")),
                  childCount: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  _AppBarDelegate({required this.minHeight, required this.maxHeight});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return ClipPath(
      clipper: Customclip(),
      child: Container(),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_AppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}

class Customclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h * 0.85);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
