import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

part 'banner_slider_state.dart';

class BannerSliderCubit extends Cubit<BannerSliderState> {
  BannerSliderCubit() : super(BannerSliderState(currentIndex: 0));

  void onPageChanged({required final int index}) {
    emit(state.copyWith(currentIndex: index));
  }
}
