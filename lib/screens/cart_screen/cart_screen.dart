import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controllers/carrt_controller.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:e_commerce/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping Cart"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
        backgroundColor: whiteColor,
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getCart(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else if (snapshot.data!.docs.isEmpty) {
              return Container(
                  color: whiteColor, child: "Empty Cart".text.makeCentered());
            } else {
              var data = snapshot.data!.docs;
              controller.calculateTotalPrice(data);
              return Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                              data[index]['image'],
                              width: 80,
                            ),
                            title: "${data[index]['title']}  (${data[index]['quantity']}X )"
                                .text
                                .fontFamily(bold)
                                .size(16)
                                .color(darkFontGrey)
                                .make(),
                            subtitle: "${data[index]['total_price']}"
                                .numCurrency
                                .text
                                .fontFamily(semibold)
                                .color(redColor)
                                .make(),
                            trailing: Icon(
                              Icons.delete,
                              color: redColor,
                            ).onTap(() {
                              FirestoreServices.deleteCart(data[index].id);
                              VxToast.show(context, msg: "Item deleted from cart");
                            })
                          );
                        },
                      ),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Total Price"
                            .text
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                        "${controller.total_price.value}"
                            .numCurrency
                            .text
                            .fontFamily(semibold)
                            .color(redColor)
                            .make()
                      ],
                    ).box.padding(EdgeInsets.all(12)).color(lightGolden).make(),
                    MyButton(
                        title: "Proceed to shipping",
                        color: redColor,
                        textColor: whiteColor,
                        onPress: () {})
                  ],
                ),
              );
            }
          }),
    );
  }
}
