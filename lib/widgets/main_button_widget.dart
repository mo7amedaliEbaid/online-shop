import 'package:flutter/material.dart';

import '../core/utils.dart';

class Mainbutton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String? image;
  final Color? txtColor;
  final Color btnColor;

  const Mainbutton({
    Key? key,
    required this.onTap,
    required this.text,
    this.image,
    this.txtColor,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(
                'assets/$image',
                height: 25.0,
                width: 60.0,
              ),
            Text(
              text,
              style: txtColor != null
                  ? kNormalStyle.copyWith(color: txtColor)
                  : kNormalStyle,
            )
          ],
        ),
      ),
    );
  }
}
