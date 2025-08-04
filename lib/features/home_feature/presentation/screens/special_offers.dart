import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/general_app_bar.dart';

import '../../../../core/theme/dimens.dart';
import '../../data/data_source/local/sample_data.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Special offers'),
      body: ListView.separated(
        itemCount: banners.length,
        itemBuilder: (final context, final index) {
          return InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(Dimens.largePadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.largePadding),
              child: Image.asset(banners[index]),
            ),
          );
        },
        separatorBuilder: (final context, final index) {
          return SizedBox(height: Dimens.largePadding);
        },
      ),
    );
  }
}
