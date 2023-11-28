import 'package:flutter/material.dart';

import '../core/utils.dart';

Widget textFieldWidget({
  required String hintTxt,
  required IconData icon,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
}) {
  return Container(
    height: 60.0,
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    margin: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.24),
          offset: Offset(0, 1),
          blurRadius: 2,
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 260.0,
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: kNormalStyle.copyWith(color: Colors.grey),
            ),
            style: kNormalStyle.copyWith(color: Colors.black54),
          ),
        ),
        Icon(
          icon,
          size: 18,
          color: Colors.grey,
        )
      ],
    ),
  );
}
