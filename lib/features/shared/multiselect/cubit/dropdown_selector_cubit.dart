import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownChipCubit<T> extends Cubit<DropdownSelectorState<T>> {
  DropdownChipCubit() : super(DropdownSelectorState<T>({}));

  void toggle(T item) {
    final next = Set<T>.from(state.selected);
    next.contains(item) ? next.remove(item) : next.add(item);
    emit(DropdownSelectorState<T>(next));
  }

  void setMultiple(Set<T> items) {
    emit(DropdownSelectorState<T>(items));
  }

  void clearSelection() {
    emit(DropdownSelectorState<T>({}));
  }

  bool isSelected(T item) => state.selected.contains(item);
}
