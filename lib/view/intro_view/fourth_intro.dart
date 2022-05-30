import 'package:auto_size_text/auto_size_text.dart';
import 'package:booker/view/auth/sign_in_view/sign_in_view.dart';
import 'package:booker/view/auth/sign_up_view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts.dart';

class FourthIntro extends StatelessWidget {
  const FourthIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/png/intro_background.png'),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: AutoSizeText(
              'Books For',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35, color: primaryColor.withOpacity(0.75)),
            ),
          ),
          SizedBox(
            height: Get.height * 0.2,
          ),
          InkWell(
            onTap: () {
              Get.to(() => SignInView(), transition: Transition.rightToLeft);
            },
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Sign In',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 56 / Get.height,
              width: Get.height * 335 / Get.height,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          InkWell(
            onTap: () {
              Get.to(() => SignUpView(), transition: Transition.leftToRight);
            },
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              height: Get.height * 56 / Get.height,
              width: Get.height * 335 / Get.height,
            ),
          )
        ],
      ),
    );
  }
}
