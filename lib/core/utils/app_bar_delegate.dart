import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/core/utils/custom_clipper.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:video_player/video_player.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  AppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.fullVideoLink,
  });
  final double minHeight;
  final double maxHeight;
  String fullVideoLink;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    context.read<PlaceVideoCubit>().controller!;
    return ClipPath(
      clipper: CustomClip(),
      child: Stack(
        children: [
          GestureDetector(
            // onHorizontalDragEnd: (details) {
            //   if (details.velocity.pixelsPerSecond.dx > 0) {
            //     Navigator.pushReplacement(
            //       context,
            //       PageRouteBuilder(
            //         pageBuilder: (context, animation, secondaryAnimation) {
            //           return PlaceVideoScreen(
            //             placeIndex: 1,
            //           ); // Replace YourDestinationWidget with your actual destination widget.
            //         },
            //         transitionsBuilder:
            //             (context, animation, secondaryAnimation, child) {
            //           const begin = Offset(-1.0, 0.0);
            //           const end = Offset.zero;
            //           const curve = Curves.easeInOut;
            //           var tween = Tween(begin: begin, end: end)
            //               .chain(CurveTween(curve: curve));

            //           return SlideTransition(
            //             position: animation.drive(tween),
            //             child: child,
            //           );
            //         },
            //       ),
            //     );
            //     // Right to left drag
            //     // Execute code for right to left drag
            //   } else {
            //     Navigator.pushReplacement(
            //       context,
            //       PageRouteBuilder(
            //         pageBuilder: (context, animation, secondaryAnimation) {
            //           return PlaceVideoScreen(
            //             placeIndex: 1,
            //           ); // Replace YourDestinationWidget with your actual destination widget.
            //         },
            //         transitionsBuilder:
            //             (context, animation, secondaryAnimation, child) {
            //           const begin = Offset(1.0, 0.0);
            //           const end = Offset.zero;
            //           const curve = Curves.easeInOut;
            //           var tween = Tween(begin: begin, end: end)
            //               .chain(CurveTween(curve: curve));

            //           return SlideTransition(
            //             position: animation.drive(tween),
            //             child: child,
            //           );
            //         },
            //       ),
            //     );

            //     // Left to right drag
            //     // Execute code for left to right drag
            //   }
            // },
            onTap: () {
              context.read<PlaceVideoCubit>().controller!.pause();
              Navigator.pushNamed(
                context,
                Routes.fullVideoRoute,
                arguments: fullVideoLink,
              );
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
                      aspectRatio: context
                          .read<PlaceVideoCubit>()
                          .controller!
                          .value
                          .aspectRatio,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: SizedBox(
                          width: context
                              .read<PlaceVideoCubit>()
                              .controller!
                              .value
                              .size
                              .width,
                          height: context
                              .read<PlaceVideoCubit>()
                              .controller!
                              .value
                              .size
                              .height,
                          child: VideoPlayer(
                            context.read<PlaceVideoCubit>().controller!,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                context.read<PlaceVideoCubit>().muted
                    ? context.read<PlaceVideoCubit>().unmute()
                    : context.read<PlaceVideoCubit>().mute();
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: 5.w,
                  bottom: 3.h,
                ),
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber,
                ),
                child: BlocBuilder<PlaceVideoCubit, PlaceVideoState>(
                  builder: (context, state) {
                    if (context.read<PlaceVideoCubit>().muted) {
                      return const Icon(Icons.volume_off);
                    }
                    return const Icon(Icons.volume_up);
                  },
                ),
              ),
            ),
          ),
        ],
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
