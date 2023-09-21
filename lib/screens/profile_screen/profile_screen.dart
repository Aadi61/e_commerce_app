import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/firebase_consts.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/controllers/profile_controller.dart';
import 'package:e_commerce/screens/auth_screen/login_screen.dart';
import 'package:e_commerce/screens/profile_screen/details_button.dart';
import 'package:e_commerce/screens/profile_screen/edit_profile_screen.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileScreenController());
    const profileButtonsList = ["Orders", "Wishlist", "Message"];
    const profileButtonsIcons = [icOrder, icOrder, icMessages];
    return bgWidget(
        child: Scaffold(

            //Stream Builder to display real time data from firestore

            body: StreamBuilder(
                stream: FirestoreServices.getUser(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    var data = snapshot.data!.docs[0];

                    return SafeArea(
                        child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.edit,
                                color: whiteColor,
                              )).onTap(() {
                            Get.to(
                                () => EditProfileScreen(context, data: data));
                          }),
                          Row(
                            children: [
                              data['imageUrl'] == ''
                                  ? Image.asset(prflImg,
                                          width: 80, fit: BoxFit.cover)
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(data['imageUrl'],
                                          width: 80, fit: BoxFit.cover)
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                              10.widthBox,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data['name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .white
                                        .make(),
                                    5.heightBox,
                                    "${data['email']}".text.white.make()
                                  ],
                                ),
                              ),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side:
                                          const BorderSide(color: whiteColor)),
                                  onPressed: () async {
                                    await Get.put(AuthController())
                                        .signoutMethod(context);
                                    Get.offAll(() => const LoginScreen());
                                  },
                                  child: "Log Out"
                                      .text
                                      .fontFamily(semibold)
                                      .white
                                      .make())
                            ],
                          ),
                          20.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              detailsButton(
                                  count: data['cart_count'],
                                  width: context.screenWidth / 3.4,
                                  title: "in your cart"),
                              detailsButton(
                                  count: data['wishlist_count'],
                                  width: context.screenWidth / 3.4,
                                  title: "in your wishlist"),
                              detailsButton(
                                  count: data['order_count'],
                                  width: context.screenWidth / 3.4,
                                  title: "you ordered")
                            ],
                          ),
                          40.heightBox,
                          ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Image.asset(
                                        profileButtonsIcons[index],
                                        width: 20,
                                      ),
                                      title: profileButtonsList[index]
                                          .text
                                          .fontFamily(semibold)
                                          .color(darkFontGrey)
                                          .make(),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      color: lightGrey,
                                    );
                                  },
                                  itemCount: profileButtonsList.length)
                              .box
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 16))
                              .shadowSm
                              .white
                              .rounded
                              .make()
                        ],
                      ),
                    ));
                  }
                })));
  }
}
