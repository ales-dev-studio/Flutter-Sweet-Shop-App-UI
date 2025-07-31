import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/utils/sized_context.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/dimens.dart';
import '../../../../core/utils/check_device_size.dart';
import '../../data/data_source/local/sample_data.dart';
import '../bloc/banner_slider_cubit.dart';

class BannerSliderWidget extends StatelessWidget {
  const BannerSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BannerSliderCubit>(
      create: (context) => BannerSliderCubit(),
      child: const _BannerSliderWidget(),
    );
  }
}

class _BannerSliderWidget extends StatelessWidget {
  const _BannerSliderWidget();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BannerSliderCubit>();
    final read = context.read<BannerSliderCubit>();
    final colors = context.theme.appColors;
    return Center(
      child: SizedBox(
        width:
            checkDesktopSize(context)
                ? Dimens.largeDeviceBreakPoint
                : context.widthPx,
        child: Column(
          spacing: Dimens.padding,
          children: [
            CarouselSlider(
              carouselController: watch.state.controller,
              items:
                  banners.map((banner) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.largePadding,
                      ),
                      child: Image.asset(banner),
                    );
                  }).toList(),
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.5,
                aspectRatio: 2.3,
                viewportFraction: 1,
                onPageChanged: (final index, final reason) {
                  read.onPageChanged(index: index);
                },
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: watch.state.currentIndex,
              count: banners.length,
              effect: WormEffect(
                activeDotColor: colors.primary,
                dotColor: colors.gray,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 4,
                type: WormType.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
