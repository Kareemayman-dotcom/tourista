import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/core/utils/custom_clipper.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:video_player/video_player.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final VideoPlayerController videoPlayerController;
  final double minHeight;
  final double maxHeight;

  AppBarDelegate(
    this.videoPlayerController, {
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipPath(
      clipper: CustomClip(),
      child: GestureDetector(
        onTap: () async {
          videoPlayerController.pause();
          Navigator.pushNamed(context, Routes.fullVideoRoute,
              arguments: 'https://youtu.be/opoZaIVWcHA');
        },
        child: SizedBox(
          height: 50.h,
          width: double.infinity,
          child: BlocConsumer<PlaceVideoCubit, PlaceVideoState>(
            listener: (context, state) {
              if (state is PlaceVideoInitial) {
                context
                    .read<PlaceVideoCubit>()
                    .controller!
                    .seekTo(const Duration(seconds: 10));

                context.read<PlaceVideoCubit>().play();
              }
            },
            builder: (context, state) {
              if (videoPlayerController.value.isInitialized) {
                return AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: SizedBox(
                      width: videoPlayerController.value.size.width,
                      height: videoPlayerController.value.size.height,
                      child: VideoPlayer(
                          context.read<PlaceVideoCubit>().controller!),
                    ),
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(AppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}
