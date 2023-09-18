import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controllers/home_screen_controller.dart';
import 'package:e_commerce/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce/screens/categories_screen/categories_screen.dart';
import 'package:e_commerce/screens/home_screen/home_screen.dart';
import 'package:e_commerce/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeScreenController());
    var screensList = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      ProfileScreen()
    ];
    var itemsList = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: "Categories"),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: "Cart"),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: "Profile"),
    ];
    return Scaffold(
      body: Obx(() => screensList.elementAt(controller.navIndex.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.navIndex.value,
            onTap: (value) {
              controller.navIndex.value = value;
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
