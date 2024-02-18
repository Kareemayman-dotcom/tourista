import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/utils/constants.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';
import 'package:tourista/widgets/place_card_widget.dart';

class PlaceVideoScreen extends StatelessWidget {
  const PlaceVideoScreen({
    required this.placeIndex,
    super.key,
  });
  final int placeIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceVideoCubit(),
      child: PlaceCardWidget(
        placeModel: places[placeIndex],
      ),
    );
  }
}
