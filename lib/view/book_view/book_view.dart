import 'dart:ui';
import 'package:booker/consts.dart';
import 'package:booker/model/book_model.dart';
import 'package:booker/view/account_view/account_view.dart';
import 'package:booker/view/pdf_view/pdf_view.dart';
import 'package:booker/view_model/account_view_model.dart';
import 'package:booker/view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BookView extends GetWidget<BookViewModel> {
  BookView({Key? key, required this.bookModel, required this.isAccount})
      : super(key: key);
  final BookModel bookModel;
  final bool isAccount;
  // ignore: annotate_overrides
  final controller = Get.put(BookViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(bookModel.poster))),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.25),
              ),
            ),
            Container(
              height: Get.height * 0.075,
              width: Get.width,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
            Positioned(
                top: Get.height * 0.1,
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bookModel.name,
                                      style: TextStyle(
                                        fontSize: Get.width * 24 / Get.width,
                                      ),
                                    ),
                                    Text(
                                      bookModel.auther,
                                      style: TextStyle(
                                        fontSize: Get.width * 20 / Get.width,
                                      ),
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
                                      itemSize: Get.width * 0.05,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: Get.width * 125 / Get.width,
                                height: Get.height * 200 / Get.height,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(bookModel.poster),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(
                                      () => PdfView(
                                            url: bookModel.pdf,
                                            name: bookModel.name,
                                          ),
                                      transition: Transition.upToDown);
                                },
                                icon: Icon(
                                  Icons.document_scanner,
                                  color: Colors.black,
                                  size: Get.width * 0.1,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.headphones,
                                  color: Colors.black,
                                  size: Get.width * 0.1,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.video_collection_rounded,
                                  color: Colors.black,
                                  size: Get.width * 0.1,
                                )),
                          ],
                        ),
                      ),
                      isAccount
                          ? InkWell(
                              onTap: () {
                                controller
                                    .removeFromYourBook(bookModel)
                                    .then((value) {
                                  AccountView a = AccountView();
                                  a.controller.dataRefresh();

                                  Get.back();
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(20),
                                height: Get.height * 0.1,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.close),
                                    Text(
                                      'Remove fom your books',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.addToYourBook(bookModel);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    padding: const EdgeInsets.all(20),
                                    height: Get.height * 0.12,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        const Icon(
                                          Icons.add,
                                        ),
                                        Text(
                                          'Add to your books',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Get.width * 14 / Get.width),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.addToWishList(bookModel);
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.all(20),
                                      height: Get.height * 0.12,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          const Icon(
                                            Icons.add,
                                          ),
                                          Text(
                                            'Add to WishList',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    Get.width * 14 / Get.width),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Add Review',
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 20)),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.6,
                                          child: RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: Get.width * 0.07,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: Get.width * 0.02),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: primaryColor,
                                            ),
                                            onRatingUpdate: (rating) {
                                              controller.rate = rating;
                                            },
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              controller
                                                  .addReview(bookModel.poster);
                                            },
                                            child: const Text(
                                              'send',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        controller.review = value;
                                      },
                                      maxLines: 5,
                                      maxLength: 65,
                                      decoration: const InputDecoration(
                                          hintText: 'type your review'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            padding: const EdgeInsets.all(20),
                            height: Get.height * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                ),
                                Text(
                                  'Add Review',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Get.width * 14 / Get.width),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
