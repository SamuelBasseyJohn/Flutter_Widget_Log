import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_flutter_widgets/Hero/hero_page_route.dart';

import 'popup_page.dart';

class MyFloatingButton extends StatelessWidget {
  void Function()? onTap;
  final Widget child;
  MyFloatingButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Popup',
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        elevation: 5,
        color: Colors.blue,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
