import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/slidable/circular_slidable_action.dart';
import 'package:board_game_app/features/shared/slidable/pop_action_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableTile extends StatefulWidget {
  final PopActionController popActionController;
  final double height;
  final Color shadowColor;
  final double extendRatio;
  final double vPadding;
  final Function() onEdit;
  final Function() onDelete;
  final Widget child;

  const SlidableTile({
    super.key,
    required this.popActionController,
    required this.onEdit,
    required this.onDelete,
    this.shadowColor = Colors.black54,
    required this.child,
    this.height = 75,
    this.extendRatio = 0.25,
    this.vPadding = 10,
  });

  @override
  _SlidableTileState createState() => _SlidableTileState();
}

class _SlidableTileState<T> extends State<SlidableTile>
    with SingleTickerProviderStateMixin {
  late final SlidableController controller;
  late final VoidCallback _closeAction;

  @override
  void initState() {
    super.initState();
    controller = SlidableController(this);

    _closeAction = () {
      controller.close();
    };

    widget.popActionController.add(_closeAction);
  }

  @override
  void dispose() {
    widget.popActionController.remove(_closeAction);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppSettingsBloc>().state.settings.theme;
    return SizedBox(
      height: widget.height,
      child: Slidable(
        controller: controller,
        closeOnScroll: true,
        endActionPane: ActionPane(
          extentRatio: widget.extendRatio,
          motion: const DrawerMotion(),
          children: [
            CircularSlidableAction(
              bgColor: Color(theme.primaryColorAccent),
              iconColor: Colors.white,
              iconData: Icons.edit_sharp,
              onPressed: () {
                controller.close();
                widget.onEdit();
              },
              vPadding: widget.vPadding,
            ),
            CircularSlidableAction(
              bgColor: Color(theme.warningColor),
              iconColor: Colors.white,
              iconData: Icons.delete_forever_sharp,
              onPressed: () {
                controller.close();
                widget.onDelete();
              },

              vPadding: widget.vPadding,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: SizedBox(
            height: widget.height,
            width: double.infinity,
            child: Card(shadowColor: widget.shadowColor, child: widget.child),
          ),
        ),
      ),
    );
  }
}
