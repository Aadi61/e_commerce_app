import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileScreenController extends GetxController {
  var nameController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  var profileImageLink = "";
  var profileImagePath = ''.obs;
  var isLoading = false.obs;
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 7);
      if (img == null) {
        return;
      }
      profileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImage() async {
    // Get the filename from the profileImagePath
    var filename = basename(profileImagePath.value);

    // Define the destination path for the image in Firebase Storage
    var destination = 'images/${currentUser!.uid}/${filename}';

    // Create a reference to the destination path in Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child(destination);

    // Upload the image file to Firebase Storage
    await ref.putFile(File(profileImagePath.value));

    // Get the download URL of the uploaded image

    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imageUrl}) async {
    var store = firestore.collection(userCollections).doc(currentUser!.uid);
    await store.set({'name': name, 'password': password, 'imageUrl': imageUrl},
        SetOptions(merge: true));
    isLoading(false);
  }

  changeAuthPassword({password, newPassword, email}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);

    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
