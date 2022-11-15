import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_flutter_widgets/Pages/page3.dart';
import 'package:my_flutter_widgets/Widgets/expansion_tile.dart';
import 'package:my_flutter_widgets/Widgets/floating_button.dart';
import 'package:my_flutter_widgets/Hero/hero_page_route.dart';
import 'package:my_flutter_widgets/Hero/popup_page.dart';

import '../Model/user.dart';

class HeroWidgetPage extends StatefulWidget {
  const HeroWidgetPage({super.key});

  @override
  State<HeroWidgetPage> createState() => _HeroWidgetPageState();
}

class _HeroWidgetPageState extends State<HeroWidgetPage> {
  List<User> profiles = [];
  _HeroWidgetPageState() {
    profiles.add(User(name: "Samuel 1", profileImage: "Images/image1.jpeg"));
    profiles.add(User(name: "Samuel 2", profileImage: "Images/image2.jpeg"));
    profiles.add(User(name: "Samuel 3", profileImage: "Images/image3.jpeg"));
    profiles.add(User(name: "Samuel 4", profileImage: "Images/image4.jpeg"));
  }

  @override
  Widget build(BuildContext context) {
    String photo1 = profiles[0].profileImage;
    String photo2 = profiles[1].profileImage;
    String photo3 = profiles[2].profileImage;
    String photo4 = profiles[3].profileImage;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Widget"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  HeroPageRoute(
                      builder: (context) => HeroLandingPage(
                            photoID: photo1,
                            tag: "profile",
                            profiles: profiles,
                          ))),
              child: Hero(
                tag: 'profile',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage(photo1),
                  ),
                ),
              ),
            ),
            title: Text(profiles[0].name),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  HeroPageRoute(
                      builder: (context) => HeroLandingPage(
                            photoID: photo2,
                            tag: "profile 0",
                            profiles: profiles,
                          ))),
              child: Hero(
                tag: 'profile 0',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(photo2),
                ),
              ),
            ),
            title: Text(profiles[1].name),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  HeroPageRoute(
                      builder: (context) => HeroLandingPage(
                            photoID: photo3,
                            profiles: profiles,
                            tag: "profile 1",
                          ))),
              child: Hero(
                tag: 'profile 1',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(photo3),
                ),
              ),
            ),
            title: Text(profiles[2].name),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  HeroPageRoute(
                      builder: (context) => HeroLandingPage(
                            photoID: photo4,
                            profiles: profiles,
                            tag: "profile 2",
                          ))),
              child: Hero(
                tag: 'profile 2',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(photo4),
                ),
              ),
            ),
            title: Text(profiles[3].name),
          ),
        ],
      ),
      floatingActionButton: MyFloatingButton(
        onTap: () {
          Navigator.push(
              context, HeroPageRoute(builder: (context) => const PopupCard()));
        },
      ),
    );
  }
}
