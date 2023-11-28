import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/colors.dart';
import '../core/utils.dart';

class TopContainer extends StatelessWidget {
  final String? title;
  final String searchBarTitle;
  bool? isSearch;

  TopContainer(
      {super.key,
      this.title,
      required this.searchBarTitle,
      this.isSearch = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            title != null
                ? Container(
                    alignment: Alignment.center,
                    height: 65,
                    child: Text(
                      title!,
                      style: kNormalStyle.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  )
                : Image.asset(
                    "assets/logo1.png",
                    fit: BoxFit.contain,
                    width: 120,
                    height: 45,
                  ),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: kGreyColor.withOpacity(0.8)),
              child: Stack(
                children: [
                  const Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.black87,
                    size: 20,
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: CachedNetworkImage(
                imageUrl:
                    'https://hips.hearstapps.com/hmg-prod/images/sam-worthington-avatar-the-way-of-the-water-1670323169.jpg?crop=0.528xw:1.00xh;0.134xw,0&resize=1200:*',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        isSearch == true
            ? Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kGreyColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: kGreyColor,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: searchBarTitle,
                  ),
                ),
              )
            : Container(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
