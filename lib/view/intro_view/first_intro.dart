import 'package:auto_size_text/auto_size_text.dart';
import 'package:booker/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FirstIntro extends StatelessWidget {
  const FirstIntro({Key? key}) : super(key: key);

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
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: AutoSizeText(
                  'Find your Books easier',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, color: primaryColor),
                ),
              ),
              AutoSizeText(
                'Used and near new secondhand books at great prices.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, color: primaryColor.withOpacity(0.75)),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          SvgPicture.asset('assets/svg/intro1.svg'),
          SizedBox(
            height: Get.height * 0.1,
          ),
        ],
      ),
    );
  }
}
