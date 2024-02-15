import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/core/utils/app_bar_delegate.dart';
import 'package:tourista/core/utils/sticky_title_delegate.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:tourista/widgets/paragraph_widget.dart';

class PlaceCardWidget extends StatelessWidget {
  const PlaceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 190, 10),
      body: Container(
        decoration: const BoxDecoration(),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: AppBarDelegate(
                context.read<PlaceVideoCubit>().controller!,
                minHeight: 27.h,
                maxHeight: 40.h,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: StickyTitleDelegate("The Pyramids Of Giza"),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ParagraphWidget(
                      header: "The Eternal Enigma of the Pyramids",
                      text:
                          "For millennia, the pyramids of ancient Egypt have stood as monolithic testaments to human ingenuity and ambition. Their geometric precision and sheer scale continue to amaze architects and historians alike, fueling endless debates and hypotheses regarding their construction techniques. The Great Pyramid of Giza, the most iconic of them all, is thought to have been built some 4,500 years ago during the reign of Pharaoh Khufu. This staggering structure, composed of over 2 million massive stone blocks, ascends to a dizzying height of 481 feet, captivating generations with the mysteries of its creation.",
                    ),
                    Expanded(
                      child: ParagraphWidget(
                        header: "The Workforce: Myth and Reality",
                        text:
                            "Contrary to popular depictions, it's widely accepted by Egyptologists that skilled laborers—not slaves—were the cornerstone of the pyramid construction effort. Discoveries of workers' settlements near the pyramids reveal evidence of organized communities with access to food, medical care, and burial chambers. These insights paint a less exploitative picture of their lives.",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
