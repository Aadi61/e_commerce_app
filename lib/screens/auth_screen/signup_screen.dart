import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/firebase_consts.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:e_commerce/widgets/logo_widget.dart';
import 'package:e_commerce/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

const iconList = [icFacebookLogo, icGoogleLogo, icTwitterLogo];

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            logoWidget(),
            10.heightBox,
            "Log in to e-Commerce".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(()=>
              Column(
                children: [
                  customTextField(
                      isPassword: false,
                      title: 'Name',
                      hint: 'Full Name',
                      controller: nameController),
                  customTextField(
                      isPassword: false,
                      title: 'Email',
                      hint: 'admin@admin.com',
                      controller: emailController),
                  customTextField(
                      isPassword: true,
                      title: 'Password',
                      hint: '********',
                      controller: passwordController),
                  customTextField(
                      isPassword: true,
                      title: 'Retype Password',
                      hint: '********',
                      controller: passwordRetypeController),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                          activeColor: redColor,
                          checkColor: whiteColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          }),
                      10.heightBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'I agree to the ',
                              style:
                                  TextStyle(fontFamily: bold, color: fontGrey)),
                          TextSpan(
                              text: 'Terms and Conditions',
                              style:
                                  TextStyle(fontFamily: bold, color: redColor)),
                          TextSpan(
                              text: ' and ',
                              style:
                                  TextStyle(fontFamily: bold, color: fontGrey)),
                          TextSpan(
                              text: 'Privacy Policy ',
                              style: TextStyle(fontFamily: bold, color: redColor))
                        ])),
                      ),
                    ],
                  ),

                  controller.isLoading.value ? CircularProgressIndicator():
                  MyButton(
                      title: 'Sign up',
                      color: isCheck == true ? redColor : lightGrey,
                      textColor: whiteColor,
                      onPress: () async {
                        controller.isLoading.value=true;
                        if (isCheck == true) {
                          try {
                            await controller
                                .signUpMethod(
                                    password: passwordController.text,
                                    email: emailController.text,
                                    context: context)
                                .then((value) {
                              return controller.storeUserData(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }).then((value) {
                              VxToast.show(context,
                                  msg: "Logged in Successfully");
                              Get.offAll(() => const Home());
                            });
                          } catch (e) {
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                            controller.isLoading.value=false;
                          }
                        }
                      }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(fontFamily: bold, color: fontGrey)),
                    TextSpan(
                        text: 'Log in',
                        style: TextStyle(color: redColor, fontFamily: bold))
                  ])).onTap(() {
                    Get.back();
                  })
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            )
          ],
        ),
      ),
    ));
  }
}
