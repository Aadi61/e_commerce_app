import 'package:e_commerce/consts/firebase_consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(userCollections)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getProduct(category) {
    return firestore
        .collection(productCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  static getCart() {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static deleteCart(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false).snapshots();
  }
}
