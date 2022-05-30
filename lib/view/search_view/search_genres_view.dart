import 'package:booker/view/genre_view/genre_view.dart';
import 'package:booker/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchGenereView extends GetWidget<SearchViewModel> {
  SearchGenereView({Key? key}) : super(key: key);
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
                      maxCrossAxisExtent: Get.width * 0.45,
                      mainAxisExtent: Get.height * 0.2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: cont.geners.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => GenreView(genre: cont.geners[index]),
                            transition: Transition.rightToLeft);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: cont.genereColors[index],
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            cont.geners[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ));
  }
}
