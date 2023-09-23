import 'package:e_commerce/consts/firebase_consts.dart';

class FirestoreServices{
  static getUser(uid){
    return firestore.collection(userCollections).where('id',isEqualTo: uid).snapshots();
  }

  static getProduct(category){
    return firestore.collection(productCollection).where('p_category',isEqualTo:category).snapshots();
  }
}