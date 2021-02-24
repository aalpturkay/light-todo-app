import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:light_todo_app/constants/constants.dart';
import 'package:meta/meta.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardState(currentPage: 0));

  bool get isLastPage =>
      state.currentPage == Constants.onBoardPageList.length - 1;

  void setCurrentPage(int pageVal) => emit(OnboardState(currentPage: pageVal));

  void goNextPage() {
    if (!isLastPage) {
      state.pageController
          .nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      print("done");
    }
  }
}
