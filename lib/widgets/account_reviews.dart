import 'package:booker/consts.dart';
import 'package:booker/model/revew_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class AccountReviews extends StatelessWidget {
  const AccountReviews({Key? key, required this.reviewModel}) : super(key: key);
  final ReviewModel reviewModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: Get.width * 0.1),
      height: Get.height * 120 / Get.height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    reviewModel.review,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.75), fontSize: 12),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RatingBarIndicator(
                  rating: reviewModel.rate.toDouble(),
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: primaryColor,
                    );
                  },
                  itemCount: 5,
                  itemSize: 15,
                  direction: Axis.horizontal,
                ),
              )
            ],
          ),
          Container(
            height: Get.height * 100 / Get.height,
            width: Get.width * 62.5 / Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(reviewModel.img), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
