import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/features/home/cubit/home_cubit.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeCubit, VideoPlayerController?>(
            builder: (context, controller) {
              if (controller?.value.isInitialized ?? false) {
                return SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: controller!.value.aspectRatio,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                          height: controller.value.size.height,
                          width: controller.value.size.width,
                          child: VideoPlayer(controller)),
                    ),
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
            },
          ),
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
                    SizedBox(height: 10.h),
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
                            shadows: const <Shadow>[
                              Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                  color: Colors.white),
                            ],
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Image.asset("assets/pyramids.png", height: 10.h)
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
                        shadows: const <Shadow>[
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
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.NavigationPage,
                    );
                  },
                  child: Container(
                    width: 70.w,
                    height: 8.h,
                    margin: EdgeInsets.only(bottom: 15.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 235, 190, 10),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
