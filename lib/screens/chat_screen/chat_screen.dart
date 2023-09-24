import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/firebase_consts.dart';
import 'package:e_commerce/controllers/chats_controller.dart';
import 'package:e_commerce/screens/chat_screen/user_message_bubble.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller= Get.put(ChatController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "${controller.friendName}".text.make(),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Obx(()=>
            controller.isLoading.value ? Center(child: CircularProgressIndicator())
            :
               Expanded(
                  child: StreamBuilder(stream: FirestoreServices.getChatMessages(controller.chatDocId.toString()), builder: 
                  (context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator());
                    }
                    else if( snapshot.data!.docs.isEmpty){
                      
                      return Center(
                       child: "Send a message...".text.make()
                      );
                    }
                    else{
                      
                      return ListView(
                        
                        
                        children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                          var data= snapshot.data!.docs[index];
                            return Align(
                              alignment: data['uid']==currentUser!.uid ? Alignment.centerRight : Alignment.centerLeft
                              ,child: UserBubble(data)); 
                        }).toList()
                      );
                    }
                  })),
            ),
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: controller.msgController,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: darkFontGrey)),
                  hintText: "Type Message..."),)),
                IconButton(onPressed: () {
                  controller.sendMsg(controller.msgController.text);
                  controller.msgController.clear();
                }, icon: Icon(Icons.send)) 
              ],
            ).box.padding(EdgeInsets.all(8)).height(60).make()
          ],
        ),
      ),
    );
  }
}
