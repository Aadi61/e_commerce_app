import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/screens/categories_screen/item_details.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesDetail extends StatelessWidget {
  final String? title;
  const CategoriesDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
          appBar: AppBar(title: title!.text.make()),
          body: StreamBuilder(
              stream: FirestoreServices.getProduct(title),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: "No products found!".text.color(darkFontGrey).make(),
                  );
                } else {
                  var data = snapshot.data!.docs;
                  return Column(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              controller.subcat.length,
                              (index) => "${controller.subcat[index]}"
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
                              itemCount: data.length,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 250,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) {
                                return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      Image.network(data[index]['p_images'][0],
                                          height: 150,
                                          width: 200,
                                          fit: BoxFit.fill),
                                      10.heightBox,
                                      "${data[index]['p_name']}"
                                          .text
                                          .color(darkFontGrey)
                                          .fontFamily(semibold)
                                          .make(),
                                      10.heightBox,
                                      "${data[index]['p_price']}"
                                          .numCurrency
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
                                  Get.to(() => ItemDetails(
                                        title: data[index]['p_name'],
                                        data: data[index],
                                      ));
                                });
                              }))
                    ],
                  );
                }
              })),
    );
  }
}
