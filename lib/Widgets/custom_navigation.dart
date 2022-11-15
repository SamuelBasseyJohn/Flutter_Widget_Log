import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 400),
        );
  final Widget child;
  AxisDirection direction = AxisDirection.right;
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: directionOffset(), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }

  Offset directionOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.right:
        return const Offset(1, 0);
      case AxisDirection.left:
        return const Offset(-1, 0);
      case AxisDirection.down:
        return const Offset(0, -1);
    }
  }
}
