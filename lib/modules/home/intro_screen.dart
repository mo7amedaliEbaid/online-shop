import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/utils.dart';
import '../../widgets/image_list_view.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  static const String routeName = '/intro';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const IntroScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: -10,
              left: -150,
              child: Row(
                children: [
                  ImageListView(starIndex: 0),
                  ImageListView(starIndex: 1),
                  ImageListView(starIndex: 2),
                ],
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(1, 1))
                  ],
                  color: Colors.black.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                "assets/logo1.png",
                fit: BoxFit.contain,
                width: 300,
                height: 60,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                      Colors.transparent,
                      Colors.white60,
                      Colors.white,
                      Colors.white,
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Appearance \nShows Your Quality',
                      style: kNormalStyle.copyWith(fontSize: 30, height: 1.3),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Change The Quality Of Your \n Appearance with Our Online Shop',
                      style: kNormalStyle.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("Sign Up with Email")),
              ))
        ],
      ),
    );
  }
}
