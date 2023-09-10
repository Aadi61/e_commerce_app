import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:e_commerce/widgets/logo_widget.dart';
import 'package:e_commerce/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
const iconList=[icFacebookLogo,icGoogleLogo, icTwitterLogo];
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight*0.1).heightBox,
              logoWidget(),
              10.heightBox,
              "Log in to e-Commerce".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(title: 'Name',hint: 'Full Name'),
                  customTextField(title: 'Email',hint: 'admin@admin.com'),
                  customTextField(title: 'Password',hint: '********'),
                  customTextField(title: 'Retype Password', hint: '********'),
                 
                    5.heightBox,
                   Row(
                    children: [
                      Checkbox(value: false, onChanged: (newValue){}
                      ),
                      10.heightBox,
                      Expanded(
                        child: RichText(text: const TextSpan(
                          children: [
                            TextSpan(text: 'I agree to the ', style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey
                            )),
                            TextSpan(text: 'Terms and Conditions', style: TextStyle(
                              fontFamily: bold,
                              color: redColor
                            )),
                            TextSpan(text: ' and ', style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey
                            )),
                            TextSpan(text: 'Privacy Policy ', style: TextStyle(
                              fontFamily: bold,
                              color: redColor
                            ))
                          ]
                        )),
                      ),
                    ],
                  ),
                   MyButton(title: 'Sign up',color :redColor,textColor: whiteColor,onPress: (){}).box.width(context.screenWidth-50).make(),
                  10.heightBox,
                  RichText(text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(fontFamily: bold, color: fontGrey)
                      ),
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(color: redColor,fontFamily: bold)
                      )
                    ]
                  )).onTap(() {
                    Get.back();
                  })
                
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make()
              
              ],
              
          ),
        ),
      )
    );
  }
}