import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Model/user.dart';

class HeroLandingPage extends StatelessWidget {
  List<User> profiles;
  String tag;
  HeroLandingPage(
      {super.key,
      required this.profiles,
      required this.tag,
      required this.photoID});
  String photoID;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 300,
      height: 400,
      child: Hero(
        tag: tag,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(photoID),
        ),
      ),
    ));
  }
}
