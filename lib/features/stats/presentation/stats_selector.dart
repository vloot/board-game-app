import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_cubit.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_selector.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';

class StatsSelector<T> extends StatelessWidget {
  final double height;
  final double halfWidth;
  final AppLocalizations l10n;
  final List<T> items;
  final DropdownChipData<T> Function(T) getChipData;
  final String title;

  const StatsSelector({
    super.key,
    required this.halfWidth,
    required this.l10n,
    required this.height,
    required this.items,
    required this.getChipData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: halfWidth,
          height: height,
          child: DropdownChipSelector<T>(
            palceholder: l10n.players,
            position: PopupPosition.bottom,
            minHeight: height,
            items: items,

            getChipData: getChipData,
            cubit: context.read<DropdownChipCubit<T>>(),
          ),
        ),
      ],
    );
  }
}
