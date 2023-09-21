import 'dart:io';

import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/images.dart';
import 'package:e_commerce/controllers/profile_controller.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:e_commerce/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget EditProfileScreen(BuildContext context, {dynamic data}) {
  var controller = Get.find<ProfileScreenController>();

  controller.nameController.text = data['name'];
  controller.passwordController.text = data['password'];
  return bgWidget(
      child: Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(),
    body: Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //If both are empty show default
          controller.profileImagePath.value == "" && data['imageUrl'] == ''
              ? Image.asset(prflImg, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make()
                  // if only local path is empty show URL pic
              : controller.profileImagePath.value == '' &&
                      data['imageUrl'] != ' '
                  ? Image.network(data['imageUrl'],
                          width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                      // if url is empty show local pic
                  : Image.file(
                      File(controller.profileImagePath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
          10.heightBox,
          MyButton(
              color: redColor,
              onPress: () {
                controller.changeImage(context);
              },
              textColor: whiteColor,
              title: "Change"),
          const Divider(),
          20.heightBox,
          customTextField(
              controller: controller.nameController,
              hint: "Full Name",
              title: "Name",
              isPassword: false),
          customTextField(
              controller: controller.passwordController,
              hint: "******",
              title: "Password",
              isPassword: true),
          20.heightBox,
          controller.isLoading.value
              ? CircularProgressIndicator()
              : SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: MyButton(
                      title: "Save",
                      color: redColor,
                      onPress: () async {
                        controller.isLoading(true);
                        await controller.uploadImage();
                        await controller.updateProfile(
                            name: controller.nameController.text,
                            password: controller.passwordController.text,
                            imageUrl: controller.profileImageLink);
                        controller.isLoading(false);
                      }))
        ],
      )
          .box
          .white
          .rounded
          .shadowSm
          .padding(const EdgeInsets.all(16))
          .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
          .make(),
    ),
  ));
}
