import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/config/routes/app_pages.dart';
import 'package:tourista/core/utils/app_strings.dart';
import 'package:tourista/features/navigation/presentation/cubit/navigation_cubit.dart';

class TouristaApp extends StatelessWidget {
  const TouristaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return  BlocProvider(
          create: (context) =>  NavigationCubit(),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          ),
        );
      },
    );
  }
}
