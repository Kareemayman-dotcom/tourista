import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  late int placeIndex;
  NavigationCubit() : super(NavigationInitial()) {
    placeIndex = 0;
  }

  void nextIndex() {
    placeIndex++;
    emit(NavigationNext());
  }

  void previousIndex() {
    placeIndex--;
    emit(NavigationPrevious());
  }
}
