import 'package:flutter/material.dart';

// Specifications

class BottomSheetButton extends StatelessWidget {
  /// Creates a button that shows a bottom sheet when pressed.
  ///
  ///
  /// * The [buttonChild] property allows you assign a widget that shows on the button
  ///
  /// * The [bottomSheetChild] property allows you assign a widget
  ///   that shows on the bottom sheet when triggered.
  ///
  /// * The [enableScroll] property allows you scroll on the bottom sheet
  ///
  /// * The [isDismissible] property allows you close the by clicking outside the bottom sheet.
  ///
  const BottomSheetButton(
      {super.key,
      required this.buttonChild,
      required this.bottomSheetChild,
      this.isDismissible = true,
      this.enableScroll = false});

  ///  Assign a widget that shows on the bottom sheet when triggered.
  final Widget bottomSheetChild;

  /// Assign a widget that shows on the button
  final Widget? buttonChild;

  ///By default, this value is set to false.
  /// perhaps if your [bottomSheetChild] widget requires more room in the bottom sheet
  /// set this value to true and it enables you scroll and fit more inside.
  final bool enableScroll;

  /// By default, this value is set to true.
  /// this allows your user to exit the bottom sheet by clicking outside the bottom sheet
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: enableScroll,
          isDismissible: isDismissible,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          context: context,
          builder: (context) => bottomSheetChild,
        );
      },
      child: buttonChild,
    );
  }
}
