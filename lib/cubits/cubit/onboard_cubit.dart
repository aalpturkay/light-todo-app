import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class OnboardCubit extends Cubit<int> {
  OnboardCubit() : super(0);

  void setCurrentPage(int pageVal) => emit(pageVal);
}
