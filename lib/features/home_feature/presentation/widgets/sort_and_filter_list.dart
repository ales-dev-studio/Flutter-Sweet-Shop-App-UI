import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/bordered_container.dart';

import '../../../../core/theme/dimens.dart';

class SortAndFilterList extends StatelessWidget {
  const SortAndFilterList({super.key, required this.titles});

  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return SizedBox(
      height: 34.0,
      child: ListView.builder(
        itemCount: titles.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (final context, final index) {
          return Padding(
            padding: const EdgeInsets.only(left: Dimens.largePadding),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(Dimens.corners),
              child: BorderedContainer(
                borderColor: index == 0 ? appColors.primary : appColors.gray2,
                color:
                    index == 0
                        ? appColors.primary.withValues(alpha: 0.15)
                        : null,
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.largePadding,
                ),
                child: Center(
                  child: Text(
                    titles[index],
                    style: TextStyle(
                      color: index == 0 ? appColors.primary : appColors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
