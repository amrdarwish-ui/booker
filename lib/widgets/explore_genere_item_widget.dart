import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreGenereItemWidget extends StatelessWidget {
  const ExploreGenereItemWidget({
    required this.color,
    required this.genere,
    Key? key,
  }) : super(key: key);
  final Color? color;
  final String genere;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: Get.width * 278 / Get.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Text(
          genere,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
