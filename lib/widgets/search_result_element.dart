import 'package:booker/model/book_model.dart';
import 'package:booker/view/book_view/book_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../consts.dart';

class SearchResultElement extends StatelessWidget {
  const SearchResultElement({
    Key? key,
    required this.bookModel,
  }) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: Get.height * 175 / Get.height,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => BookView(bookModel: bookModel, isAccount: false),
                  transition: Transition.rightToLeft);
            },
            child: Container(
              height: Get.height * 175 / Get.height,
              width: Get.width * 115 / Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(bookModel.poster), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1),
                        blurRadius: 10)
                  ]),
            ),
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  bookModel.auther,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                RatingBarIndicator(
                  rating: bookModel.rate.toDouble(),
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
                Text(
                  bookModel.genre,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
