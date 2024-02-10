import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/constants.dart';
import 'package:video_player/video_player.dart';

import 'widgets/paragraph_widget.dart';

class PlaceCard extends StatefulWidget {
  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset('assets/pyramids.mp4')
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error) {
        print('Error during video initialization: $error');
      });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
    _videoPlayerController.setVolume(0);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 218, 69),
<<<<<<< Updated upstream
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
=======
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _AppBarDelegate(
              _videoPlayerController,
              minHeight: 27.h,
              maxHeight: 40.h,
            ),
          ),
          SliverPersistentHeader(
              // pinned: true,
              pinned: true,
              floating: true,
              delegate: _StickyTitleDelegate("The Pyramids Of Giza")),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ParagraphWidget(
                        header: "The Eternal Enigma of the Pyramids",
                        text:
                            "For millennia, the pyramids of ancient Egypt have stood as monolithic testaments to human ingenuity and ambition. Their geometric precision and sheer scale continue to amaze architects and historians alike, fueling endless debates and hypotheses regarding their construction techniques. The Great Pyramid of Giza, the most iconic of them all, is thought to have been built some 4,500 years ago during the reign of Pharaoh Khufu. This staggering structure, composed of over 2 million massive stone blocks, ascends to a dizzying height of 481 feet, captivating generations with the mysteries of its creation."),
                    ParagraphWidget(
                        header: "The Workforce: Myth and Reality",
                        text:
                            "Contrary to popular depictions, it's widely accepted by Egyptologists that skilled laborers—not slaves—were the cornerstone of the pyramid construction effort. Discoveries of workers' settlements near the pyramids reveal evidence of organized communities with access to food, medical care, and burial chambers. These insights paint a less exploitative picture of their lives.")
                  ],
                ),
              ),
            ),
          )
>>>>>>> Stashed changes
        ],
      ),
    );
  }
}

class _StickyTitleDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  _StickyTitleDelegate(this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 10.h; // Adjust height as needed
  @override
  double get minExtent => 10.h; // Adjust height as needed
  @override
  bool shouldRebuild(_StickyTitleDelegate oldDelegate) =>
      title != oldDelegate.title;
}

class _AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final VideoPlayerController videoPlayerController; // Declare a variable

  _AppBarDelegate(this.videoPlayerController,
      {required this.minHeight, required this.maxHeight});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return ClipPath(
      clipper: Customclip(),
<<<<<<< Updated upstream
      child: Container(),
=======
      child: SizedBox(
        height: 50.h,
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: SizedBox(
              width: videoPlayerController.value.size.width,
              height: videoPlayerController.value.size.height,
              child: VideoPlayer(videoPlayerController),
            ),
          ),
        ),
      ),
>>>>>>> Stashed changes
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
