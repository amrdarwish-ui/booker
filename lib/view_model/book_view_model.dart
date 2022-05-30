import 'package:booker/consts.dart';
import 'package:booker/dialogs.dart';
import 'package:booker/model/book_model.dart';
import 'package:booker/model/revew_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BookViewModel extends GetxController {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  CollectionReference wishListRef =
      FirebaseFirestore.instance.collection('wishList');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  num rate = 3;
  String review = '';

  void addReview(String poster) {
    try {
      showLodingDialog();
      ReviewModel model = ReviewModel(review: review, img: poster, rate: rate);
      userRef.doc(firebaseAuth.currentUser!.uid).update({
        'reviews': FieldValue.arrayUnion([model.toMap()])
      }).then((value) {
        Get.back();
        Get.back();
        Get.snackbar('Done', ' Review added to your profile');
      });
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString());
    }
  }

  void addToYourBook(BookModel bookModel) async {
    try {
      showLodingDialog();
      await userRef.doc(firebaseAuth.currentUser!.uid).update({
        'books': FieldValue.arrayUnion([bookModel.toMap()])
      }).then((value) {
        Get.back();
        Get.snackbar('Done', 'Added to your books',
            backgroundColor: primaryColor);
      });
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString());
    }
  }

  void addToWishList(BookModel bookModel) async {
    try {
      Map map = bookModel.toMap();
      map.putIfAbsent('uid', () => FirebaseAuth.instance.currentUser!.uid);
      showLodingDialog();
      await wishListRef.doc().set(map).then((value) {
        Get.back();
        Get.snackbar('Done', 'Added to WishList',
            backgroundColor: primaryColor);
      });
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> removeFromYourBook(BookModel bookModel) async {
    try {
      showLodingDialog();
      await userRef.doc(firebaseAuth.currentUser!.uid).update({
        'books': FieldValue.arrayRemove([bookModel.toMap()])
      }).then((value) {
        Get.back();
      });
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString());
    }
  }
}
