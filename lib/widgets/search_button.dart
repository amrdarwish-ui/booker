import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../consts.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: Get.width * 335 / Get.width,
        height: Get.height * 56 / Get.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: grayColor),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Search Books, Authors, or ISBN',
              style: TextStyle(
                  color: Colors.black, fontSize: Get.width * 16 / Get.width),
            ),
            const Spacer(),
            SvgPicture.asset('assets/svg/filter.svg'),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}
