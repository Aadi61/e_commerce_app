import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/screens/categories_screen/categories_detail.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    var categoriesImg = [
      imgFc1,
      imgFc2,
      imgFc3,
      imgFc4,
      imgFc5,
      imgFc6,
      imgFc7,
      imgFc8,
      imgFc9
    ];
    var categoriesList = [
      "Women Dress",
      "Computer & Accessories",
      "Automobile & Motorcycle",
      "Kids & Toys",
      "Sports",
      "Mobile Phones",
      "Beauty, Health & Hair",
      "Jewellery & Watches",
      "Furiniute",
    ];
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: "Categories".text.fontFamily(bold).white.make(),
      ),
      body: Container(
          child: GridView.builder(
              itemCount: 9,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Image.asset(
                        categoriesImg[index],
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      "${categoriesList[index]}"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .align(TextAlign.center)
                          .make()
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .clip(Clip.antiAlias)
                      .outerShadowSm
                      .make()
                      .onTap(() {
                        controller.getSubCategories(categoriesList[index]);
                    Get.to(()=>CategoriesDetail(title: categoriesList[index]));
                  }),
                );
              })),
    ));
  }
}
