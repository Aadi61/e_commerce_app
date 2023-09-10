import 'package:e_commerce/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
Widget MyButton({String? title,color,textColor, onPress}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: color,
    padding: EdgeInsets.all(12)
  ),
    onPressed: onPress
    , 
    child: title!.text.color(textColor).fontFamily(bold).make()
  );
}