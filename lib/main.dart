import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/home_page.dart';
import 'package:tourista/place_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.id: (context) => const HomePage(),
            PlaceCard.id: (context) => const PlaceCard(),
          },
          home: const HomePage(),
        );
      },
    );
  }
}
