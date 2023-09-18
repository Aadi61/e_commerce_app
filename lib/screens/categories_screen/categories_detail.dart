import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/screens/categories_screen/item_details.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesDetail extends StatelessWidget {
  final String? title;
  const CategoriesDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          appBar: AppBar(title: title!.text.make()),
          body: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) => "Clothing"
                          .text
                          .size(12)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .white
                          .rounded
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .size(120, 60)
                          .make()),
                ),
              ),
              20.heightBox,
              Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 250,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Image.asset(imgP5,
                                  height: 150, width: 200, fit: BoxFit.fill),
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
                            .outerShadowSm
                            .roundedSM
                            .make()
                            .onTap(() {
                          Get.to(ItemDetails(
                            title: "Random title",
                          ));
                        });
                      }))
            ],
          )),
    );
  }
}
