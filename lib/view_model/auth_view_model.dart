import 'package:booker/dialogs.dart';
import 'package:booker/model/user_model.dart';
import 'package:booker/view/home_view/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool? stayLoggedin = false;
  bool isValidated = false;
  bool isClicked = false;
  String? uid;

  //for email validate
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  //for ui
  void changeCheckBox(bool? value) {
    stayLoggedin = value;
    update();
  }

  //for sign in ui animation
  void buttonValidate() {
    if ((isEmail(emailController.text)) &&
        passwordController.text.length >= 8) {
      isValidated = true;
      update();
    } else {
      isValidated = false;
      update();
    }
  }

  void signUp() async {
    try {
      showLodingDialog();
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        UserModel userModel = UserModel(
            name: nameController.text,
            uid: firebaseAuth.currentUser!.uid,
            email: emailController.text,
            password: passwordController.text,
            phone: int.parse(phoneController.text),
            img: '',
            bio: 'there are no bio',
            books: [],
            reviews: []);
        await firebaseFirestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .set(userModel.toMap())
            .catchError((m) {
          Get.back();
          Get.snackbar('Erorr', m, snackPosition: SnackPosition.BOTTOM);
        }).then((value) {
          Get.back();
          Get.back();

          Get.snackbar('Done', 'Please sgin in',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white);
        });
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Erorr', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void sginIn() {
    isClicked = true;
    update();
    firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .catchError((e) {
      isClicked = false;
      update();

      Get.snackbar('Erorr', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }).then((value) {
      if (value != null) {
        Get.offAll(HomeView(), transition: Transition.downToUp);
        uid = firebaseAuth.currentUser!.uid;
        print(uid);
      }
    });
  }
}
