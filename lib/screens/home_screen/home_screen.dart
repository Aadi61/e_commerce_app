import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/widgets/featured_button.dart';
import 'package:e_commerce/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var featuredImages1 = [imgS1, imgS2, imgS3];
    var featuredImages2 = [imgS4, imgS5, imgS6];
    var featuredTitles1 = ["Women Dress", "Girls Dress", "Girls Watches"];
    var featuredTitles2 = ["Boys Glasses", "Mobile Phones", "T-Shirts"];
    var brandsList = [imgSlider1, imgSlider2, imgSlider3, imgSlider4];
    var secondSliderList = [imgSs1, imgSs2, imgSs3, imgSs4];
    return Container(
      color: lightGrey,
      width: context.width,
      height: context.height,
      padding: EdgeInsets.all(12),
      child: SafeArea(
          child: Column(
        children: [
          //Search Text Field
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: 'Search anything',
                  hintStyle: TextStyle(color: textfieldGrey)),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      height: 150,
                      autoPlay: true,
                      //autoPlayAnimationDuration: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      itemCount: brandsList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(brandsList[index], fit: BoxFit.fill)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

                  10.heightBox,

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButton(
                              width: context.screenWidth / 2.5,
                              height: context.screenHeight * 0.15,
                              title:
                                  index == 0 ? "Today's Deals" : "Flash Sale",
                              icon: index == 0 ? icTodaysDeal : icFlashDeal))),

                  10.heightBox,

                  //Slider
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      height: 150,
                      autoPlay: true,
                      //autoPlayAnimationDuration: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(secondSliderList[index],
                                fit: BoxFit.fill)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

                  10.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButton(
                            width: context.screenWidth / 3.5,
                            height: context.screenHeight * 0.15,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: index == 0
                                ? 'Top Categories'
                                : index == 1
                                    ? 'Brands'
                                    : 'Top Sellers')),
                  ),

                  10.heightBox,

                  Align(
                      alignment: Alignment.centerLeft,
                      child: 'Feature Categories'
                          .text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make()),

                  20.heightBox,

                  //Featured Categories

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          3,
                          (index) => Column(
                                children: [
                                  featuredButton(
                                      icon: featuredImages1[index],
                                      title: featuredTitles1[index]),
                                  10.heightBox,
                                  featuredButton(
                                      icon: featuredImages2[index],
                                      title: featuredTitles2[index])
                                ],
                              )),
                    ),
                  ),
                  20.heightBox,
                  //Featured Products

                  Container(
                    decoration: BoxDecoration(color: redColor),
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    child: Column(children: [
                      "Featured Products"
                          .text
                          .fontFamily(bold)
                          .size(18)
                          .white
                          .make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              6,
                              (index) => Column(
                                    children: [
                                      Image.asset(imgP1,
                                          width: 150, fit: BoxFit.fill),
                                      10.heightBox,
                                      "Laptop 4GB"
                                          .text
                                          .color(darkFontGrey)
                                          .fontFamily(semibold)
                                          .make(),
                                      10.heightBox,
                                      "\$600"
                                          .text
                                          .color(redColor)
                                          .size(16)
                                          .fontFamily(bold)
                                          .make()
                                    ],
                                  )
                                      .box
                                      .white
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 4))
                                      .padding(EdgeInsets.all(8))
                                      .roundedSM
                                      .make()),
                        ),
                      )
                    ]),
                  ),

                  20.heightBox,

                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Image.asset(imgP5,
                                  height: 200, width: 200, fit: BoxFit.fill),
                              10.heightBox,
                              "Laptop 4GB"
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(semibold)
                                  .make(),
                              10.heightBox,
                              "\$600"
                                  .text
                                  .color(redColor)
                                  .size(16)
                                  .fontFamily(bold)
                                  .make()
                            ])
                            .box
                            .white
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .padding(EdgeInsets.all(12))
                            .roundedSM
                            .make();
                      })
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
