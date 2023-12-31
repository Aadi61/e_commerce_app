import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/firebase_consts.dart';
import 'package:e_commerce/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {

  @override
  void onInit() {
    getChatId();
    super.onInit();
  }
  var chats = firestore.collection(chatsCollection);
  var friendName = Get.arguments[0];
  var friendId = Get.arguments[1];

  var senderName = Get.find<HomeScreenController>().username;
  var currentId = currentUser!.uid;

  var msgController = TextEditingController();
  var isLoading=false.obs;

  dynamic chatDocId;

  getChatId() async {
    isLoading(true);
    await chats
        .where('users', isEqualTo: {friendId: null, currentId: null})
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            
            chatDocId = snapshot.docs.single.id;
          } else {
            
            chats.add({
              "created_on": null,
              "last_msg": "",
              "users": {currentId: null, friendId: null},
              "toId": "",
              "fromId": "",
              "friend_name": '',
              "sender_name": ''
            }).then((value) {
              chatDocId = value.id;
            });
          }
        });
        print(chatDocId);
        isLoading(false);
  }

  sendMsg(String msg) async{
    if(msg.trim().isNotEmpty){
     await chats.doc(chatDocId).update({
        'created_on': FieldValue.serverTimestamp(),
        'last_msg': msg,
        'toId': friendId,
        'fromId': currentId,
        'friend_name': friendName,
        'sender_name': senderName

      });
      await chats.doc(chatDocId).collection(messagesCollection).doc().set({
        'created_on': FieldValue.serverTimestamp(),
        'msg': msg,
        'uid': currentId
      });
    }
  }
}
