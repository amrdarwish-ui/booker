import 'package:booker/view/genre_view/genre_view.dart';
import 'package:booker/view_model/search_view_model.dart';
import 'package:booker/widgets/best_seller_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAllBooksView extends GetWidget<SearchViewModel> {
  SearchAllBooksView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  final controller = Get.put(SearchViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewModel>(
        builder: (cont) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: Get.width * 0.4,
                      mainAxisExtent: Get.height * 0.4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: cont.booksList.length,
                  itemBuilder: (context, index) {
                    return BestSellersitemWidget(
                        bookModel: cont.booksList[index]);
                  },
                ),
              ),
            ));
  }
}
