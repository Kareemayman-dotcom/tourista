import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/core/utils/constants.dart';
import 'package:tourista/features/full_video/cubit/full_video.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullVideoScreen extends StatelessWidget {
  final String videoUrl;
  final BuildContext placeVideoContext;
  const FullVideoScreen(
      {required this.videoUrl, super.key, required this.placeVideoContext});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FullVideoCubit()..initYoutubePlayer(videoUrl),
        ),
        BlocProvider.value(
            value: placeVideoContext.read<PlaceVideoCubit>()..play()),
      ],
      child: BlocBuilder<FullVideoCubit, YoutubePlayerController?>(
        builder: (context, controller) {
          // if (controller == null) {
          //   return const Scaffold(
          //     body: Center(child: CircularProgressIndicator()),
          //   );
          return PopScope(
            onPopInvoked: (didPop) async {
              context.read<PlaceVideoCubit>().play();
              Navigator.pop(context);
            },
            child: Scaffold(
              floatingActionButton: GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.navigationPage,
                    (route) => false,
                  );
                },
                child: SizedBox(
                  height: 10.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Home",
                        style: speedDialChildLabelStyle,
                      ),
                      Container(
                        width: 50.sp,
                        height: 50.sp,
                        margin: EdgeInsets.only(left: 6.w),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 4),
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 235, 190, 10),
                        ),
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: controller == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : OrientationBuilder(
                      builder: (context, orientation) {
                        return Stack(
                          children: [
                            if (orientation == Orientation.portrait)
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/videowallpaper.jpg',
                                    ),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              )
                            else
                              const Text(''),
                            Center(
                              child: YoutubePlayer(
                                controller: controller,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
