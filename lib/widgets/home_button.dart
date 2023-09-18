import 'package:e_commerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButton({width, height, String? title, icon}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).make();
}
