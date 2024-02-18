import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/core/utils/app_bar_delegate.dart';
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
                  child: GestureDetector(
                    onTap: () async {
                      final url = Uri.parse(placeModel.locationAddress);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 5.w,
                        bottom: 3.h,
                      ),
                      height: 15.w,
                      width: 15.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.amber,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
