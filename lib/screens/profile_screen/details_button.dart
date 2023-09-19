import 'package:e_commerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget detailsButton({String? count, width,String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make()
    ],
  ).box.white.roundedSM.width(width).height(80).padding(EdgeInsets.all(4)).make();
}