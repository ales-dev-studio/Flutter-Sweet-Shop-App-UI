part of 'banner_slider_cubit.dart';

class BannerSliderState {
  BannerSliderState({required this.currentIndex});

  final int currentIndex;
  final CarouselSliderController controller = CarouselSliderController();

  BannerSliderState copyWith({
    int? currentIndex,
  }) {
    return BannerSliderState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
