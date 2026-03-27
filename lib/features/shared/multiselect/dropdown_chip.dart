import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:flutter/material.dart';

class DropdownChip extends StatelessWidget {
  final DropdownChipData chipData;
  final bool selected;
  final Function(bool value) onSelected;

  const DropdownChip({
    super.key,
    required this.chipData,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ChoiceChip(
        key: ValueKey(chipData.chipValue),
        padding: EdgeInsets.all(3),
        side: BorderSide(
          color: chipData.color,
          strokeAlign: 1.5,
          width: selected ? 2 : 0.4,
        ),
        selectedColor: chipData.color.withAlpha(55),
        label: Text(
          chipData.label,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        selected: selected,
        showCheckmark: false,
        onSelected: onSelected,
      ),
    );
  }
}
