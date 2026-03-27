import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_cubit.dart';
import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_state.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownChipContent<T> extends StatelessWidget {
  final List<T> items;
  final DropdownChipData<T> Function(T item) getChipData;
  final bool allowMultiple;
  final DropdownChipCubit<T> cubit;

  const DropdownChipContent({
    super.key,
    required this.items,
    required this.getChipData,
    required this.allowMultiple,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownChipCubit<T>, DropdownSelectorState<T>>(
      bloc: cubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: FractionallySizedBox(
            widthFactor: 0.85,
            alignment: AlignmentGeometry.center,
            child: Wrap(
              verticalDirection: VerticalDirection.up,
              alignment: WrapAlignment.start,
              spacing: 7,
              runSpacing: 7,
              children: List.generate(items.length, (index) {
                final chipData = getChipData(items[index]);
                final selected = state.selected.contains(items[index]);
                return DropdownChip(
                  chipData: chipData,
                  selected: selected,
                  onSelected: (value) {
                    if (allowMultiple) {
                      cubit.toggle(chipData.chipValue);
                    } else {
                      cubit.setMultiple({chipData.chipValue});
                    }
                  },
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
