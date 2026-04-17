import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_cubit.dart';
import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_state.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';

class DropdownChipSelector<T> extends StatelessWidget {
  final String palceholder;
  final List<T> items;
  final DropdownChipData<T> Function(T item) getChipData;
  final bool allowMultiple;
  final DropdownChipCubit<T> cubit;
  final T? defaultValue;

  const DropdownChipSelector({
    super.key,
    required this.palceholder,
    required this.items,
    required this.getChipData,
    required this.cubit,
    this.allowMultiple = true,
    this.defaultValue,
  });

  @override
  Widget build(BuildContext context) {
    if (defaultValue != null) {
      cubit.toggle(defaultValue as T);
    }
    return BlocProvider<DropdownChipCubit<T>>(
      create: (_) => cubit,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: CustomPopup(
          position: PopupPosition.top,
          showArrow: true,
          content: BlocProvider.value(
            value: cubit,
            child: DropdownChipContent<T>(
              getChipData: getChipData,
              items: items,
              allowMultiple: allowMultiple,
              cubit: cubit,
            ),
          ),
          child: Container(
            constraints: BoxConstraints(minHeight: 62),
            padding: EdgeInsets.only(top: 14, right: 16, bottom: 14, left: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: BoxBorder.all(color: Colors.black87),
            ),
            child: BlocBuilder<DropdownChipCubit<T>, DropdownSelectorState<T>>(
              builder: (context, state) {
                final children = <Widget>[];
                if (state.selected.isEmpty) {
                  children.add(
                    Text(
                      palceholder,
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                  );
                } else {
                  final lst = state.selected.toList();
                  children.addAll(
                    List.generate(
                      state.selected.length,
                      (index) => DropdownChip(
                        chipData: getChipData(lst[index]),
                        selected: true,
                        onSelected: (value) {
                          cubit.toggle(lst[index]);
                        },
                      ),
                    ),
                  );
                }
                return Stack(
                  alignment: AlignmentGeometry.topLeft,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.end,
                      spacing: 10,
                      runSpacing: 10,
                      children: children,
                    ),
                    Positioned(
                      top: 10,
                      bottom: 10,
                      right: 0,
                      child: Icon(Icons.arrow_drop_down_sharp),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
