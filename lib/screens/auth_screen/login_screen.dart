import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:e_commerce/widgets/logo_widget.dart';
import 'package:e_commerce/widgets/my_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight*0.1).heightBox,
              logoWidget(),
              10.heightBox,
              "Log in to e-Commerce".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Column(
                children: [
                  customTextField(title: 'Email',hint: 'admin@admin.com'),
                  customTextField(title: 'Password',hint: '********'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed:() {}, child: 'Forget Password'.text.make())),
                    5.heightBox,
                    MyButton(title: 'Log in',color :redColor,textColor: whiteColor,onPress: (){}).box.width(context.screenWidth-50).make(),
                    'or create a new account?'.text.color(fontGrey).make(),
                    5.heightBox,
                    MyButton(title: 'Sign up',color: golden,textColor: redColor,onPress: (){}).box.width(context.screenWidth-50).make()
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).make()
              
              ],
              
          ),
        ),
      )
    );
  }
}