import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);

  void updateSelectedIndex({required int newIndex}) {
    emit(newIndex);
  }
}
