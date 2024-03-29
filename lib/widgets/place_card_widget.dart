import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/core/utils/app_bar_delegate.dart';
import 'package:tourista/core/utils/constants.dart';
import 'package:tourista/core/utils/sticky_title_delegate.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:tourista/models/place_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceCardWidget extends StatelessWidget {
  const PlaceCardWidget({
    required this.placeModel,
    super.key,
  });
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 190, 10),
      body: Container(
        decoration: const BoxDecoration(),
        child: BlocBuilder<PlaceVideoCubit, PlaceVideoState>(
          builder: (context, state) {
            if (state is PlaceVideoInitial) {
              context
                  .read<PlaceVideoCubit>()
                  .initializeController(placeModel.shortVideoAddress);
            }
            // if (ModalRoute.of(context)?.isCurrent == true) {
            //   // We're back on Page 1
            //   context.read<PlaceVideoCubit>().play();
            // }
            if (state is PlaceVideoUnpause) {
              context.read<PlaceVideoCubit>().play();
            }
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: AppBarDelegate(
                        fullVideoLink: placeModel.fullVideoUrl,
                        minHeight: 27.h,
                        maxHeight: 40.h,
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: StickyTitleDelegate(placeModel.title),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: placeModel.paragraphs,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: EdgeInsets.only(
                        right: 5.w,
                        bottom: 3.h,
                      ),
                      child: placeModel.ticketAddress == null
                          ? SpeedDial(
                              animatedIcon: AnimatedIcons.menu_close,
                              childPadding: EdgeInsets.only(bottom: 2.h),
                              childrenButtonSize: Size(50.sp, 50.sp),
                              overlayColor: Colors.black,
                              overlayOpacity: .3,
                              children: [
                                SpeedDialChild(
                                    labelBackgroundColor: Colors.transparent,
                                    label: "Location",
                                    labelStyle: speedDialChildLabelStyle,
                                    labelShadow: [],
                                    elevation: 10,
                                    onTap: () async {
                                      final url =
                                          Uri.parse(placeModel.locationAddress);
                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                    shape: CircleBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 190, 10),
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 24.sp,
                                    )),
                                SpeedDialChild(
                                    labelBackgroundColor: Colors.transparent,
                                    label: "Watch A Video",
                                    labelStyle: speedDialChildLabelStyle,
                                    labelShadow: [],
                                    elevation: 10,
                                    onTap: () async {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushNamed(
                                        context,
                                        Routes.fullVideoRoute,
                                        arguments: [
                                          context,
                                          placeModel.fullVideoUrl
                                        ],
                                      );
                                    },
                                    shape: CircleBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 190, 10),
                                    child: Icon(
                                      Icons.ondemand_video_rounded,
                                      color: Colors.white,
                                      size: 24.sp,
                                    )),
                                SpeedDialChild(
                                    labelBackgroundColor: Colors.transparent,
                                    label: "Home",
                                    labelStyle: speedDialChildLabelStyle,
                                    labelShadow: [],
                                    elevation: 10,
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.navigationPage,
                                        (route) => false,
                                      );
                                    },
                                    shape: CircleBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 190, 10),
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,
                                      size: 24.sp,
                                    )),
                              ],
                            )
                          : SpeedDial(
                              animatedIcon: AnimatedIcons.menu_close,
                              childPadding: EdgeInsets.only(bottom: 2.h),
                              childrenButtonSize: Size(50.sp, 50.sp),
                              overlayColor: Colors.black,
                              overlayOpacity: .3,
                              children: [
                                SpeedDialChild(
                                    labelBackgroundColor: Colors.transparent,
                                    label: "Location",
                                    labelStyle: speedDialChildLabelStyle,
                                    labelShadow: [],
                                    elevation: 10,
                                    onTap: () async {
                                      final url =
                                          Uri.parse(placeModel.locationAddress);
                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                    shape: CircleBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 190, 10),
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 24.sp,
                                    )),
                                SpeedDialChild(
                                    labelBackgroundColor: Colors.transparent,
                                    label: "Book now",
                                    labelStyle: speedDialChildLabelStyle,
                                    labelShadow: [],
                                    elevation: 10,
                                    onTap: () async {
                                      final url =
                                          Uri.parse(placeModel.ticketAddress!);

                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                    shape: CircleBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 190, 10),
                                    child: Icon(
                                      Icons.book_online_rounded,
                                      color: Colors.white,
                                      size: 24.sp,
                                    )),
                                SpeedDialChild(
                                    labelBackgroundColor: Colors.transparent,
                                    label: "Watch A Video",
                                    labelStyle: speedDialChildLabelStyle,
                                    labelShadow: [],
                                    elevation: 10,
                                    onTap: () async {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushNamed(
                                        context,
                                        Routes.fullVideoRoute,
                                        arguments: [
                                          context,
                                          placeModel.fullVideoUrl
                                        ],
                                      );
                                    },
                                    shape: CircleBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 190, 10),
                                    child: Icon(
                                      Icons.ondemand_video_rounded,
                                      color: Colors.white,
                                      size: 24.sp,
                                    )),
                                SpeedDialChild(
                                    labelBackgroundColor: Colors.transparent,
                                    label: "Home",
                                    labelStyle: speedDialChildLabelStyle,
                                    labelShadow: [],
                                    elevation: 10,
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.navigationPage,
                                        (route) => false,
                                      );
                                    },
                                    shape: CircleBorder(),
                                    backgroundColor:
                                        Color.fromARGB(255, 235, 190, 10),
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,
                                      size: 24.sp,
                                    )),
                              ],
                            )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
