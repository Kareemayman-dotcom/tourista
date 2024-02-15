import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/config/routes/app_routes.dart';
import 'package:tourista/core/utils/app_strings.dart';
import 'package:tourista/features/full_video/screens/full_video_screen.dart';
import 'package:tourista/features/home/cubit/home_cubit.dart';
import 'package:tourista/features/home/screens/home_screen.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:tourista/features/place_video/screens/place_video_screen.dart';

/// Application routes
class AppRoutes {
  /// this method is used to generate the routes
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => HomeCubit()..initializeVideo(),
              child: const HomeScreen(),
            );
          },
          maintainState: true,
          settings: const RouteSettings(name: Routes.initialRoute),
        );

      case Routes.placeVideoRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => PlaceVideoCubit(),
              child: const PlaceVideoScreen(),
            );
          },
          maintainState: true,
          settings: const RouteSettings(name: Routes.placeVideoRoute),
        );

      case Routes.fullVideoRoute:
        return MaterialPageRoute(
          builder: (context) {
            return FullVideoScreen(
              videoUrl: routeSettings.arguments as String,
            );
          },
          maintainState: true,
          settings: const RouteSettings(name: Routes.fullVideoRoute),
        );

      default:
        return undefinedRoute();
    }
  }

  /// this method is used to undefinedRoute the routes
  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('undefinedRoute'),
        ),
      ),
      settings: const RouteSettings(name: AppStrings.noRouteFound),
    );
  }
}
