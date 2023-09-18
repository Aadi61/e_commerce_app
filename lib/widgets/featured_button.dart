import 'package:e_commerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )
      .box
      .width(200)
      .color(whiteColor)
      .roundedSM
      .outerShadowSm
      .padding(EdgeInsets.all(4))
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .make();
}
