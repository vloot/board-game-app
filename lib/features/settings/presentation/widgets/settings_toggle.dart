import 'package:flutter/material.dart';

class SettingsToggle<T, V> extends StatefulWidget {
  final String settingName;
  final T initValue;
  final Map<T, V> segmentsMap;
  final IconData iconData;
  final bool multiSelection;
  final bool emptySelection;
  final ValueChanged<T> onSelectionChanged;

  const SettingsToggle({
    super.key,
    required this.settingName,
    required this.segmentsMap,
    required this.iconData,
    required this.onSelectionChanged,
    required this.initValue,
    this.multiSelection = false,
    this.emptySelection = false,
  });

  @override
  _SettingsToggleState createState() => _SettingsToggleState<T, V>();
}

class _SettingsToggleState<T, V> extends State<SettingsToggle<T, V>> {
  late Set<T> _selection;

  @override
  void initState() {
    super.initState();
    _selection = <T>{widget.initValue};
  }

  @override
  void didUpdateWidget(covariant SettingsToggle<T, V> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initValue != widget.initValue) {
      setState(() {
        _selection = <T>{widget.initValue};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.iconData),
      title: Text(widget.settingName),
      trailing: SegmentedButton<T>(
        multiSelectionEnabled: widget.multiSelection,
        emptySelectionAllowed: widget.emptySelection,
        showSelectedIcon: false,
        segments: getSegments(),
        selected: _selection,
        onSelectionChanged: (Set<T> newSelection) {
          setState(() {
            _selection = newSelection;
          });
          widget.onSelectionChanged(_selection.first);
        },
      ),
    );
  }

  List<ButtonSegment<T>> getSegments() {
    final res = <ButtonSegment<T>>[];
    for (var key in widget.segmentsMap.keys) {
      Widget child;
      if (widget.segmentsMap[key] is Widget) {
        child = widget.segmentsMap[key] as Widget;
      } else if (widget.segmentsMap[key] is String) {
        child = Text(
          widget.segmentsMap[key]! as String,
          style: TextStyle(fontSize: 14),
        );
      } else {
        child = Text('invalid_type');
      }
      res.add(
        ButtonSegment<T>(
          value: key,
          label: Container(
            width: 60,
            constraints: BoxConstraints(minHeight: double.infinity),
            child: Center(child: child),
          ),
        ),
      );
    }
    return res;
  }
}
