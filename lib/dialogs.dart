import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLodingDialog() {
  Get.dialog(
      WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              color: Colors.white,
              height: Get.height * 0.1,
              width: Get.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/gif/loding.gif'),
                  const Text(
                    'loading',
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false);
}

showSureDialog(Function yesFun, String content) {
  Get.defaultDialog(title: 'Are You sure', content: Text(content), actions: [
    TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('cancel')),
    TextButton(
        onPressed: () {
          Get.back();
          yesFun();
        },
        child: const Text('yes')),
  ]);
}
