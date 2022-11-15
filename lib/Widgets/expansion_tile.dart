import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  /// This creates a single list tile widget that expands to show more items(widgets)
  /// Input those widgets into the [children] property
  /// You can track the tile's expansion using the
  ExpansionTileWidget(
      {Key? key, required this.children, required this.onExpansionChanged})
      : super(key: key);
  List<Widget> children;
  void Function(bool) onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Tiles"),
      children: children,
    );
  }
}
