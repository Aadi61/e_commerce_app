import 'package:e_commerce/consts/firebase_consts.dart';

class FirestoreServices{
  static getUser(uid){
    return firestore.collection(userCollections).where('id',isEqualTo: uid).snapshots();
  }
}