import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/firebase_consts.dart';
import 'package:e_commerce/consts/images.dart';
import 'package:e_commerce/screens/auth_screen/login_screen.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/widgets/logo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/consts/styles.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user){
        if(user==null && mounted){
          Get.to(() => const LoginScreen());
        }
        else{
          Get.to(()=>const  Home());
        }
      });
      
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              )),
          20.heightBox,
          logoWidget(),
          10.heightBox,
          'e-Commerce'.text.fontFamily(bold).size(22).white.make()
        ]),
      ),
    );
  }
}
