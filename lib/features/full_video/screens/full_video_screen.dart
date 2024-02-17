import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/features/full_video/cubit/full_video.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullVideoScreen extends StatelessWidget {
  final String videoUrl;

  const FullVideoScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FullVideoCubit()..initYoutubePlayer(videoUrl),
      child: BlocBuilder<FullVideoCubit, YoutubePlayerController?>(
        builder: (context, controller) {
          // if (controller == null) {
          //   return const Scaffold(
          //     body: Center(child: CircularProgressIndicator()),
          //   );
          return PopScope(
            canPop: true,
            onPopInvoked: (didPop) async {
              context.read<PlaceVideoCubit>().backInFocus();
              Navigator.pop(context);
            },
            child: Scaffold(
                body: controller == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : OrientationBuilder(
                        builder: (context, orientation) {
                          return Stack(
                            children: [
                              orientation == Orientation.portrait
                                  ? Container(
                                      height: 100.h,
                                      width: 100.w,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/videowallpaper.jpg"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    )
                                  : const Text(''),
                              Center(
                                child: YoutubePlayer(
                                  controller: controller!,
                                ),
                              ),
                            ],
                          );
                        },
                      )),
          );
        },
      ),
    );
  }
}
