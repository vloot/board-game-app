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
  final int maxSelectionLimit;
  final DropdownChipCubit<T> cubit;

  const DropdownChipContent({
    super.key,
    required this.items,
    required this.getChipData,
    required this.allowMultiple,
    required this.cubit,
    this.maxSelectionLimit = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownChipCubit<T>, DropdownSelectorState<T>>(
      bloc: cubit,
      builder: (context, state) {
        final List<Widget> children = List.generate(items.length, (index) {
          final chipData = getChipData(items[index]);
          final selected = state.selected.contains(items[index]);
          return DropdownChip(
            chipData: chipData,
            selected: selected,
            onSelected: (value) {
              if (allowMultiple) {
                bool doToggle = false;

                if (maxSelectionLimit <= 0) {
                  // no limit
                  doToggle = true;
                } else if (cubit.state.selected.length < maxSelectionLimit ||
                    !value) {
                  doToggle = true;
                }

                if (doToggle) {
                  cubit.toggle(chipData.chipValue);
                }
              } else {
                cubit.setMultiple({chipData.chipValue});
              }
            },
          );
        });

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: FractionallySizedBox(
            widthFactor: 0.85,
            alignment: AlignmentGeometry.center,
            child: Wrap(
              verticalDirection: VerticalDirection.up,
              alignment: WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: [
                ...children,
                Center(
                  child: Text(
                    'Maximum of $maxSelectionLimit items allowed',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
