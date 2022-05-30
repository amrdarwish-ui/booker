import 'package:auto_size_text/auto_size_text.dart';
import 'package:booker/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ThirdIntro extends StatelessWidget {
  const ThirdIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: AutoSizeText(
                  'Share books with Friends',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, color: primaryColor),
                ),
              ),
              AutoSizeText(
                "If you're looking to downsize, sell or recycle old books, the Book Grocer can help.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, color: primaryColor.withOpacity(0.75)),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          SvgPicture.asset('assets/svg/intro3.svg'),
          SizedBox(
            height: Get.height * 0.1,
          ),
        ],
      ),
    );
  }
}
