import 'package:booker/model/book_model.dart';
import 'package:booker/model/wish_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class WishListViewModel extends GetxController {
  List<BookModel> wishList = [];
  CollectionReference wishListRef =
      FirebaseFirestore.instance.collection('wishList');
  @override
  void onInit() {
    getWishList();
    super.onInit();
  }

  void getWishList() async {
    await wishListRef
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      wishList.clear();
      for (var i in value.docs) {
        BookModel bookModel = BookModel.fromMap(i);
        bookModel.id = i.id;
        wishList.add(bookModel);
      }
      update();
    });
  }

  void delete(String id) async {
    await wishListRef.doc(id).delete();
    getWishList();
  }
}
