import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/core/utils/constants.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          ),
          Center(
            child: SizedBox(
              height: 60.h,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: places.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.placeVideoRoute,
                        arguments: index,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(3.w),
                      height: 10.h,
                      width: 5.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(places[index].thumbnailAddress),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white.withAlpha(240),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          places[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
