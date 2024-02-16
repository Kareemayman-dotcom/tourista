import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:tourista/core/utils/app_bar_delegate.dart';
import 'package:tourista/core/utils/sticky_title_delegate.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:tourista/models/place_model.dart';
import 'package:tourista/widgets/paragraph_widget.dart';

class PlaceCardWidget extends StatelessWidget {
  PlaceModel placeModel;

  PlaceCardWidget({
    Key? key,
    required this.placeModel,
  }) : super(key: key);

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
            return CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: AppBarDelegate(
                    context.read<PlaceVideoCubit>().controller!,
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
                        children: placeModel.paragraphs),
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
