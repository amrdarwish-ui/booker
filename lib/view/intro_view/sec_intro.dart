import 'package:auto_size_text/auto_size_text.dart';
import 'package:booker/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SecIntro extends StatelessWidget {
  const SecIntro({Key? key}) : super(key: key);

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
                  'The first 2 books for free',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, color: primaryColor),
                ),
              ),
              AutoSizeText(
                "We've successfully opened 20 stores across Australia.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, color: primaryColor.withOpacity(0.75)),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          SvgPicture.asset('assets/svg/intro2.svg'),
          SizedBox(
            height: Get.height * 0.1,
          ),
        ],
      ),
    );
  }
}
