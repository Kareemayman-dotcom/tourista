import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/core/utils/app_life_cycle_manager.dart';
import 'package:tourista/core/utils/life_cycle_observer.dart';
import 'package:tourista/features/home/cubit/home_cubit.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(LifecycleObserver(context: context));
    return Scaffold(
      body: BlocBuilder<HomeCubit, VideoPlayerController?>(
        builder: (context, state) {
          if (state?.value.isInitialized ?? false) {
            return Stack(
              children: [
                SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: state!.value.aspectRatio,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        height: state.value.size.height,
                        width: state.value.size.width,
                        child: VideoPlayer(state),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(50, 255, 189, 35)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tourista',
                                style: TextStyle(
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2.0
                                    ..color = Colors.black,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 2,
                                      color: Colors.white,
                                    ),
                                  ],
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Image.asset('assets/pyramids.png', height: 60.sp),
                            ],
                          ),
                          Text(
                            'Explore fun historical places in the city.',
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
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                  color: Color.fromARGB(255, 235, 190, 10),
                                ),
                              ],
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<HomeCubit>().close();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.navigationPage,
                            (route) => false,
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
                                'Explore now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Image.asset('assets/tourist.png'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
            // return SizedBox(
            //   height: 100.h,
            //   width: double.infinity,
            //   child: AspectRatio(
            //     aspectRatio: state!.value.aspectRatio,
            //     child: FittedBox(
            //       fit: BoxFit.fitHeight,
            //       child: SizedBox(
            //         height: state.value.size.height,
            //         width: state.value.size.width,
            //         child: VideoPlayer(state),
            //       ),
            //     ),
            //   ),
            // );
          } else {
         return   Stack(
              children: [
                Center(child: CircularProgressIndicator()),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(50, 255, 189, 35)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tourista',
                                style: TextStyle(
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2.0
                                    ..color = Colors.black,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 2,
                                      color: Colors.white,
                                    ),
                                  ],
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Image.asset('assets/pyramids.png', height: 60.sp),
                            ],
                          ),
                          Text(
                            'Explore fun historical places in the city.',
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
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                  color: Color.fromARGB(255, 235, 190, 10),
                                ),
                              ],
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<HomeCubit>().close();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.navigationPage,
                            (route) => false,
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
                                'Explore now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Image.asset('assets/tourist.png'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
            // return const Center(
            //   child: CircularProgressIndicator.adaptive(),
            // );
          }
          // return Stack(
          //   children: [
          //     BlocBuilder<HomeCubit, VideoPlayerController?>(
          //       // chaaaaaaaaaange the builder locaaaaaaaation up to fix the release bug rebuild when the app cycle change
          //       builder: (context, controller) {

          //       },
          //     ),
          //     Container(
          //       height: 100.h,
          //       width: 100.w,
          //       decoration: const BoxDecoration(
          //           color: Color.fromARGB(50, 255, 189, 35)),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             children: [
          //               SizedBox(height: 10.h),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     'Tourista',
          //                     style: TextStyle(
          //                       fontSize: 50.sp,
          //                       fontWeight: FontWeight.bold,
          //                       foreground: Paint()
          //                         ..style = PaintingStyle.stroke
          //                         ..strokeWidth = 2.0
          //                         ..color = Colors.black,
          //                       shadows: const <Shadow>[
          //                         Shadow(
          //                           offset: Offset(1, 1),
          //                           blurRadius: 2,
          //                           color: Colors.white,
          //                         ),
          //                       ],
          //                       fontFamily: 'Poppins',
          //                     ),
          //                   ),
          //                   Image.asset('assets/pyramids.png', height: 60.sp),
          //                 ],
          //               ),
          //               Text(
          //                 'Explore fun historical places in the city.',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                   fontSize: 28.sp,
          //                   fontWeight: FontWeight.bold,
          //                   foreground: Paint()
          //                     ..style = PaintingStyle.stroke
          //                     ..strokeWidth = 1.0
          //                     ..color = Colors.white,
          //                   shadows: const <Shadow>[
          //                     Shadow(
          //                       offset: Offset(1, 1),
          //                       blurRadius: 2,
          //                       color: Color.fromARGB(255, 235, 190, 10),
          //                     ),
          //                   ],
          //                   fontFamily: 'Poppins',
          //                 ),
          //               ),
          //             ],
          //           ),
          //           GestureDetector(
          //             onTap: () {
          //               context.read<HomeCubit>().close();
          //               Navigator.pushNamedAndRemoveUntil(
          //                 context,
          //                 Routes.navigationPage,
          //                 (route) => false,
          //               );
          //             },
          //             child: Container(
          //               width: 70.w,
          //               height: 8.h,
          //               margin: EdgeInsets.only(bottom: 15.h),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(25),
          //                 color: const Color.fromARGB(255, 235, 190, 10),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     'Explore now',
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 20.sp,
          //                     ),
          //                   ),
          //                   Image.asset('assets/tourist.png'),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
