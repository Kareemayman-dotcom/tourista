import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/core/utils/custom_clipper.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:tourista/features/place_video/screens/place_video_screen.dart';
import 'package:video_player/video_player.dart';

import '../../features/navigation/presentation/cubit/navigation_cubit.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final VideoPlayerController videoPlayerController;
  final double minHeight;
  final double maxHeight;
  String fullVideoLink;
  AppBarDelegate(this.videoPlayerController,
      {required this.minHeight,
      required this.maxHeight,
      required this.fullVideoLink});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipPath(
      clipper: CustomClip(),
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            context.read<NavigationCubit>().previousIndex();
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return PlaceVideoScreen(
                    placeIndex: context.read<NavigationCubit>().placeIndex,
                  ); // Replace YourDestinationWidget with your actual destination widget.
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
            // Right to left drag
            // Execute code for right to left drag
          } else {
            context.read<NavigationCubit>().nextIndex();
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return PlaceVideoScreen(
                    placeIndex: context.read<NavigationCubit>().placeIndex,
                  ); // Replace YourDestinationWidget with your actual destination widget.
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
            ;
            // Left to right drag
            // Execute code for left to right drag
          }
        },
        onTap: () async {
          videoPlayerController.pause();
          Navigator.pushNamed(context, Routes.fullVideoRoute,
              arguments: fullVideoLink);
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
              if (context
                  .read<PlaceVideoCubit>()
                  .controller!
                  .value
                  .isInitialized) {
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
