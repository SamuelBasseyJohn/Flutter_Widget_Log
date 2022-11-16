import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_flutter_widgets/PageRoute/custom_navigation.dart';
import 'package:my_flutter_widgets/Widgets/image_picker.dart';

class PopupCard extends StatelessWidget {
  const PopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: 'Popup',
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hero Popup",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    const SizedBox(
                      height: 150,
                      child: Text(
                          "Hero Widget helps you implement super clean transition animations while maintaining an object, Keeping users focus on the object and leading them to the next page"),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            CustomPageRoute(child: const ImagePickerPage()));
                      },
                      child: const Text('Next Widget'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
