part of 'bottom_navigation_cubit.dart';

class BottomNavigationState {
  BottomNavigationState({required this.selectedIndex});

  final int selectedIndex;

  BottomNavigationState copyWith({
    int? selectedIndex,
  }) {
    return BottomNavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
