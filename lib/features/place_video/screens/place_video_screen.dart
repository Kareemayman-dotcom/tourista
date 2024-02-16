import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/place_video/cubit/place_video_cubit.dart';

import 'package:tourista/widgets/place_card_widget.dart';

import '../../../core/utils/constants.dart';

class PlaceVideoScreen extends StatelessWidget {
  int placeIndex;
  PlaceVideoScreen({
    Key? key,
    required this.placeIndex,
  }) : super(key: key);

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
