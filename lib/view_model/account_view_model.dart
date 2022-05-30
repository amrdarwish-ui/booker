import 'dart:io';

import 'package:booker/dialogs.dart';
import 'package:booker/model/book_model.dart';
import 'package:booker/model/revew_model.dart';
import 'package:booker/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountViewModel extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel? userModel;
  List<BookModel> books = [];
  File? image;
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void dataRefresh() {
    userModel = null;
    books.clear();
    update();
    getUser();
  }

  void getUser() async {
    try {
      users.doc(firebaseAuth.currentUser!.uid).get().then((value) {
        userModel = UserModel.fromMap(value);
        for (var i in userModel!.books) {
          books.add(BookModel.fromMap(i));
        }
        update();
      });
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void pickImage() async {
    XFile xImage;
    final picker = ImagePicker();

    xImage = (await picker.pickImage(source: ImageSource.gallery))!;
    image = File(xImage.path);
    update();
  }

  Future<void> saveEdit(String name, String bio) async {
    showLodingDialog();
    String? url;
    if (image != null) {
      var uploadTask = await FirebaseStorage.instance
          .ref()
          .child('user/${FirebaseAuth.instance.currentUser!.uid}')
          .putFile(image!);
      url = await (await uploadTask).ref.getDownloadURL();
    }
    await users
        .doc(firebaseAuth.currentUser!.uid)
        .update(image != null
            ? {'name': name, 'bio': bio, 'img': url}
            : {
                'name': name,
                'bio': bio,
              })
        .then((value) {
      dataRefresh();
      Get.back();
      Get.back();
    });
  }

  void deleteReview(ReviewModel reviewModel) async {
    try {
      showLodingDialog();
      await users.doc(firebaseAuth.currentUser!.uid).update({
        'reviews': FieldValue.arrayRemove([reviewModel.toMap()])
      }).then((value) {
        Get.back();

        dataRefresh();
      });
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString());
    }
  }
}
