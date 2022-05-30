import 'package:booker/view_model/explore_view_model.dart';
import 'package:booker/widgets/best_seller_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreView extends GetWidget<ExploreViewModel> {
  GenreView({Key? key, required this.genre}) {
    super.key;
    controller.getGenres(genre);
  }
  // ignore: annotate_overrides
  final controller = Get.put(ExploreViewModel());
  final String genre;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreViewModel>(
        builder: (cont) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                genre,
                style: const TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                    cont.genresList.clear();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: Colors.white,
                  )),
            ),
            body: cont.genresList.isEmpty
                ? Center(
                    child: Image.asset(
                      'assets/gif/loding.gif',
                      height: 50,
                      width: 50,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: Get.width * 0.43,
                          mainAxisExtent: Get.height * 0.4,
                          // childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: cont.genresList.length,
                      itemBuilder: (context, index) {
                        return BestSellersitemWidget(
                          bookModel: cont.genresList[index],
                        );
                      },
                    ),
                  )));
  }
}
