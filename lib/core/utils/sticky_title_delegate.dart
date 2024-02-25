import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StickyTitleDelegate extends SliverPersistentHeaderDelegate {
  StickyTitleDelegate(this.title);
  final String title;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    ;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.black,
              blurRadius: 3.0, // Adjust blur strength
              offset: Offset(2.0, 2.0), // Adjust offset
            ),
          ],
        ),
      ),
      // child: Text(
      //   title,
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 22.sp,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
    );
  }

  @override
  double get maxExtent => 10.h;
  @override
  double get minExtent => 10.h;

  @override
  bool shouldRebuild(StickyTitleDelegate oldDelegate) =>
      title != oldDelegate.title;
}
