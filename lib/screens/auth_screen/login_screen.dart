import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/screens/auth_screen/signup_screen.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:e_commerce/widgets/logo_widget.dart';
import 'package:e_commerce/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

const iconList = [icFacebookLogo, icGoogleLogo, icTwitterLogo];

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                      title: 'Email',
                      hint: 'admin@admin.com',
                      isPassword: false,
                      controller: controller.emailController),
                  customTextField(
                      title: 'Password',
                      hint: '********',
                      isPassword: true,
                      controller: controller.passwordController),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: 'Forget Password'.text.make())),
                  5.heightBox,
            
                  controller.isLoading.value ? CircularProgressIndicator():
                  MyButton(
                      title: 'Log in',
                      color: redColor,
                      textColor: whiteColor,
                      onPress: () async {
                        controller.isLoading(true);
                        await controller
                            .loginMethod(context: context)
                            .then((value) {
                              
                          if (value != null) {
                            
                            VxToast.show(context, msg: "Logged in successfully");
                            Get.offAll(() => Home());  
                          }
                          else{
                            controller.isLoading(false);
                          }
                              
                              
                        });
                      }).box.width(context.screenWidth - 50).make(),
            
                  'or create a new account?'.text.color(fontGrey).make(),
                  5.heightBox,
                  MyButton(
                      title: 'Sign up',
                      color: lightGolden,
                      textColor: redColor,
                      onPress: () {
                        Get.to(() => SignUpScreen());
                      }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  'Log in with'.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: EdgeInsets.all(8),
                                child: CircleAvatar(
                                    backgroundColor: lightGrey,
                                    radius: 25,
                                    child: Image.asset(
                                      iconList[index],
                                      width: 30,
                                    )),
                              )))
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
