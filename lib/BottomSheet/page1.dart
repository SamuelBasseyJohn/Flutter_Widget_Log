import 'package:flutter/material.dart';

import 'package:my_flutter_widgets/BottomSheet/bottom_sheet.dart';

import '../Hero/page2.dart';
import '../PageRoute/custom_navigation.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet Widget"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: BottomSheetButton(
            enableScroll: true,
            buttonChild: const Text('Click Me'),
            bottomSheetChild: makeDismissible(
              child: DraggableScrollableSheet(
                initialChildSize: 0.5,
                maxChildSize: 0.9,
                minChildSize: 0.3,
                builder: (context, scrollController) => Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 10,
                          child: Center(
                            child: Container(
                              height: 5,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: ListView(
                          controller: scrollController,
                          shrinkWrap: true,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Text Sample",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in placerat risus, sed eleifend nunc. Curabitur quis risus ac sapien interdum varius a vel metus. Donec vestibulum vestibulum libero, ac maximus elit ornare id. Nulla vitae efficitur arcu. Sed tempor neque blandit libero molestie ultricies. Quisque elementum porttitor ornare. Pellentesque feugiat egestas sem, at eleifend nibh ornare sed. Fusce mi est, tempus a varius eget, finibus quis orci. Quisque iaculis pellentesque dapibus. In nec nibh varius, rhoncus turpis in, fermentum elit. Fusce iaculis eu tellus eu consequat. Aenean non euismod neque. Donec in arcu sit amet nibh auctor porttitor in at risus. Proin et convallis dui. Maecenas ultrices ligula lectus, a tempor mi dapibus sit amet. Sed fringilla finibus augue, nec pulvinar justo posuere a. Maecenas mollis venenatis ipsum quis pellentesque. Proin ac ultrices nulla. Phasellus mollis purus nulla, a ultrices nisl mollis non. Praesent euismod tempus mi accumsan congue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;Suspendisse lorem neque, varius nec porttitor ac, rutrum sit amet orci. Aliquam id fermentum lectus. Nunc commodo eget ligula a porta. Pellentesque at ex odio. Suspendisse varius arcu sit amet feugiat tempus. Ut semper tempor magna, id viverra elit ullamcorper id. Sed varius dictum neque sit amet hendrerit. Nam ut lorem eget dolor malesuada condimentum. Curabitur pulvinar fermentum ornare. Etiam aliquet lorem metus, vel placerat turpis facilisis non. Aenean rutrum velit quam, ut bibendum nunc varius at. Vivamus iaculis eget magna et consequat.Integer maximus a nulla sed venenatis. In hac habitasse platea dictumst. Proin lectus nunc, semper vel magna porttitor, varius hendrerit ante. Suspendisse vel hendrerit eros. Nulla a suscipit odio"),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);

                                  Navigator.push(
                                    context,
                                    CustomPageRoute(
                                      child: const HeroWidgetPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(200, 50)),
                                child: const Text('Next Widget'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  // Create a method that allows the sheet to be dismissible
  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
}
