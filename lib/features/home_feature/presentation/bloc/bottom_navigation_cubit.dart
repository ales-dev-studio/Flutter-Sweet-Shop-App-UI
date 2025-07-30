import 'package:bloc/bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(selectedIndex: 0));

  void onItemTap({required final int index}) {
    emit(state.copyWith(selectedIndex: index));
  }
}
