import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/app.dart';
import 'package:tourista/core/utils/bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const TouristaApp());
}
