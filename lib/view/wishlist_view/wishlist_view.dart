import 'package:booker/view_model/wish_list_view_model.dart';
import 'package:booker/widgets/wish_list_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistView extends GetWidget<WishListViewModel> {
  WishlistView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  final controller = Get.put(WishListViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListViewModel>(
        builder: (cont) => SafeArea(
                child: Scaffold(
                    body: RefreshIndicator(
              onRefresh: () async {
                cont.getWishList();
              },
              child: cont.wishList.isEmpty
                  ? ListView(
                      children: [
                        SizedBox(
                            height: Get.height * 0.8,
                            child: Center(
                                child: Text("Nothing in your WishList"))),
                      ],
                    )
                  : ListView.builder(
                      itemCount: cont.wishList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: Get.height * 220 / Get.height,
                          child: Stack(
                            children: [
                              WishListElement(bookModel: cont.wishList[index]),
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: ElevatedButton(
                                    onPressed: () {
                                      cont.delete(cont.wishList[index].id!);
                                    },
                                    child: const Text(
                                      'Remove',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                    ),
            ))));
  }
}
