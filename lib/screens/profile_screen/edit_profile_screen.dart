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
  //controller.newPasswordController.text = data['password'];
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
              10.heightBox,
          customTextField(
              controller: controller.oldPasswordController,
              hint: "******",
              title: "Old Password",
              isPassword: true),
              10.heightBox,
          customTextField(
              controller: controller.newPasswordController,
              hint: "******",
              title: "New Password",
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

                        if(controller.profileImagePath.isNotEmpty){
                          await controller.uploadImage();
                        }
                        else{
                          controller.profileImageLink=data['imageUrl'];
                        }

                        if(data['password']==controller.oldPasswordController.text){
                        await controller.changeAuthPassword(
                          email: data['email'],
                          password: controller.oldPasswordController.text,
                          newPassword: controller.newPasswordController.text
                        );
                        await controller.updateProfile(
                            name: controller.nameController.text,
                            password: controller.newPasswordController.text,
                            imageUrl: controller.profileImageLink);
                        controller.isLoading(false);
                        VxToast.show(context, msg: "Updated");
                        } 
                        else{
                          VxToast.show(context, msg: "Wrong Password");
                          controller.isLoading(false);
                        }                       
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
