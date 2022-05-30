import 'package:auto_size_text/auto_size_text.dart';
import 'package:booker/consts.dart';
import 'package:booker/model/book_model.dart';
import 'package:booker/view/book_view/book_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BestSellersitemWidget extends StatelessWidget {
  const BestSellersitemWidget({
    required this.bookModel,
    Key? key,
  }) : super(key: key);

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Get.to(
              () => BookView(
                    bookModel: bookModel,
                    isAccount: false,
                  ),
              transition: Transition.rightToLeft);
        },
        child: SizedBox(
          height: Get.height * 0.4,
          width: Get.width * 127 / Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 200 / Get.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(bookModel.poster),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 10)
                    ]),
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              AutoSizeText(
                bookModel.name.length > 15
                    ? bookModel.name
                        .replaceRange(14, bookModel.name.length, '...')
                    : bookModel.name,
                textAlign: TextAlign.start,
                maxFontSize: 16,
                minFontSize: 10,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              AutoSizeText(
                bookModel.auther,
                textAlign: TextAlign.start,
                maxFontSize: 13,
                minFontSize: 9,
                style: TextStyle(color: subtitleColor.withOpacity(0.5)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
