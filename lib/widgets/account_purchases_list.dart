import 'package:booker/model/book_model.dart';
import 'package:booker/view/book_view/book_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPurchasesList extends StatelessWidget {
  const AccountPurchasesList({
    required this.bookList,
    required this.reveiwsLength,
    Key? key,
  }) : super(key: key);
  final List<BookModel> bookList;
  final int reveiwsLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 30, top: 30, left: Get.width * 0.1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: Get.height * 0.025,
          ),
          Text(
            'Your purchases (${bookList.length})',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Get.height * 0.025,
          ),
          SizedBox(
            height: Get.height * 240 / Get.height,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: bookList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 15,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                        () => BookView(
                              bookModel: bookList[index],
                              isAccount: true,
                            ),
                        transition: Transition.rightToLeft);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Get.height * 20 / Get.height),
                    width: Get.width * 125 / Get.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(bookList[index].poster),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              blurRadius: 10)
                        ]),
                  ),
                );
              },
            ),
          ),
          Text(
            'Your reviews ($reveiwsLength)',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
