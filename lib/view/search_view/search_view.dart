import 'dart:ui';

import 'package:booker/consts.dart';
import 'package:booker/view/search_view/real_search_view.dart';
import 'package:booker/view/search_view/search_all_books_view.dart';
import 'package:booker/view/search_view/search_genres_view.dart';
import 'package:booker/view_model/search_view_model.dart';
import 'package:booker/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchView extends GetWidget<SearchViewModel> {
  SearchView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  final controller = Get.put(SearchViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewModel>(
        builder: (cont) => SafeArea(
              child: Scaffold(
                body: SizedBox(
                  height: Get.height,
                  width: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 20 / Get.height,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => RaelSearchView(),
                                    transition: Transition.downToUp);
                              },
                              child: const SearchButton(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      SizedBox(
                        height: Get.height * 0.08,
                        child: TabBar(
                            isScrollable: true,
                            controller: cont.tabController,
                            labelColor: Colors.black,
                            indicator: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 10)
                            ]),
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                            indicatorColor: Colors.transparent,
                            tabs: const [
                              Tab(
                                text: 'Genres',
                              ),
                              Tab(
                                text: 'All Books',
                              )
                            ]),
                      ),
                      Expanded(
                          child: TabBarView(
                              controller: cont.tabController,
                              children: [
                            SearchGenereView(),
                            SearchAllBooksView(),
                          ]))
                    ],
                  ),
                ),
              ),
            ));
  }
}
