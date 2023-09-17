import 'package:e_commerce/consts/colors.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/images.dart';
import 'package:e_commerce/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller= Get.put(HomeScreenController());
    var itemsList=[
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,), label: "Home"),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,), label: "Categories"),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,), label: "Cart"),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,), label: "Profile"),
    ];
    return Scaffold(
      body: Container(),
      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          currentIndex: controller.navIndex.value,
          onTap: (value) {
            controller.navIndex.value=value;
          },
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: itemsList),
      ),
    );
  }
}