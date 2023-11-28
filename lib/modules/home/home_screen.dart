import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/colors.dart';

import '../../modules/user/profil_screen.dart';
import '../branches/branches_screens/category_display_screen.dart';
import '../cart/cart_screens/cart_display_screen.dart';
import '../products/products_screens/product_display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final pageController = PageController(initialPage: 0);

    final tabBarIcons = [
      FontAwesomeIcons.house,
      FontAwesomeIcons.compass,
      FontAwesomeIcons.cartShopping,
      FontAwesomeIcons.user
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              children: [
                ProductDisplayScreen(),
                BranchDisplayScreen(),
                CartDisplayScreen(),
                ProfileScreen(),
              ],
            ),
            Positioned(
              bottom: 14,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(40.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...tabBarIcons.map((icon) => IconButton(
                          icon: Icon(
                            icon,
                            color: Color(0xFF376B3A),
                            size: 22,
                          ),
                          onPressed: () {
                            icon == FontAwesomeIcons.house
                                ? pageController.jumpToPage(0)
                                : icon == FontAwesomeIcons.compass
                                    ? pageController.jumpToPage(1)
                                    : icon == FontAwesomeIcons.cartShopping
                                        ? pageController.jumpToPage(2)
                                        : pageController.jumpToPage(3);
                          },
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
