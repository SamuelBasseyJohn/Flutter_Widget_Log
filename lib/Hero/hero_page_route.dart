import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

/// The type `T` specifies the return type of the route which can be supplied as
/// the route is popped from the stack via [Navigator.pop] by providing the
/// optional `result` argument.

// NOTE: The hero widget cant transition from widget of one type to another type
// for example, a button cant transition to a container with Hero.

class HeroPageRoute<T> extends PageRoute<T> {
  HeroPageRoute(
      {required WidgetBuilder builder, super.fullscreenDialog, super.settings})
      : _builder = builder;

  final WidgetBuilder _builder;

  @override
  Color? get barrierColor => Colors.black87;

  @override
  String? get barrierLabel => "Tap to dismiss";

  @override
  bool get opaque => false;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  bool get barrierDismissible => true;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}
