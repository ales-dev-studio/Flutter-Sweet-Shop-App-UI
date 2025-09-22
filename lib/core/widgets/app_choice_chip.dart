import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selected: selected,
      onSelected: onSelected,
      selectedColor: context.theme.appColors.primary,
      showCheckmark: false,
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
    );
  }
}
