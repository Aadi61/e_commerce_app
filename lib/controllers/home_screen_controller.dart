import 'package:e_commerce/consts/firebase_consts.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  @override
  void onInit() {
    getUserName();
    super.onInit();
  }
  
  var navIndex= 0.obs;
  var username='';

  getUserName() async{
    var n  = await firestore.collection(userCollections).where('id',isEqualTo: currentUser!.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.single['name'];
      }
    });

    username = n;
    
  }
}