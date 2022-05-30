import 'dart:ui';

import 'package:booker/view_model/search_view_model.dart';
import 'package:booker/widgets/search_result_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../consts.dart';

class RaelSearchView extends GetView<SearchViewModel> {
  RaelSearchView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  final controller = Get.put(SearchViewModel());
  String searchtype = 'name';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewModel>(
        builder: (cont) => SafeArea(
              child: Scaffold(
                body: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 20 / Get.height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: Get.width * 260 / Get.width,
                              height: Get.height * 56 / Get.height,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  cont.search(value, searchtype);
                                },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Seach with : "),
                                                RadioListTile(
                                                  value: 'name',
                                                  groupValue: searchtype,
                                                  onChanged: (value) {
                                                    searchtype =
                                                        value.toString();
                                                    Get.back();
                                                  },
                                                  activeColor: primaryColor,
                                                  title:
                                                      const Text('Book name'),
                                                ),
                                                RadioListTile(
                                                  value: 'auther',
                                                  groupValue: searchtype,
                                                  onChanged: (value) {
                                                    searchtype =
                                                        value.toString();
                                                    Get.back();
                                                  },
                                                  activeColor: primaryColor,
                                                  title:
                                                      const Text('Author name'),
                                                ),
                                                RadioListTile(
                                                  value: 'genre',
                                                  groupValue: searchtype,
                                                  onChanged: (value) {
                                                    searchtype =
                                                        value.toString();
                                                    Get.back();
                                                  },
                                                  activeColor: primaryColor,
                                                  title:
                                                      const Text('Genre name'),
                                                ),
                                              ]),
                                        ));
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/svg/filter.svg',
                                      ),
                                    ),
                                    suffixIconConstraints: const BoxConstraints(
                                        maxHeight: 40, maxWidth: 40)),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Cancel',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black))),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: cont.searchResultsList.length,
                        itemBuilder: (context, index) {
                          return SearchResultElement(
                            bookModel: cont.searchResultsList[index],
                          );
                        },
                      ))
                    ],
                  ),
                ),
              ),
            ));
  }
}
