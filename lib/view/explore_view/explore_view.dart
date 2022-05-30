import 'package:auto_size_text/auto_size_text.dart';
import 'package:booker/consts.dart';
import 'package:booker/view/genre_view/genre_view.dart';
import 'package:booker/view/home_view/home_view.dart';
import 'package:booker/view_model/explore_view_model.dart';
import 'package:booker/widgets/best_seller_item_widget.dart';
import 'package:booker/widgets/explore_genere_item_widget.dart';
import 'package:booker/widgets/top_picks_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ExploreView extends GetWidget<ExploreViewModel> {
  ExploreView({
    Key? key,
  }) : super(key: key);

  // ignore: annotate_overrides
  final controller = Get.put(ExploreViewModel());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreViewModel>(
        builder: (cont) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
              ),
              body: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    color: cont.isOpend ? primaryColor : Colors.white,
                    duration: const Duration(milliseconds: 800),
                    height: cont.isOpend ? 0 : 800,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/png/homepic.png',
                            fit: BoxFit.cover,
                          )),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AutoSizeText(
                                  'Our Top Picks',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900),
                                ),
                                InkWell(
                                  child:
                                      SvgPicture.asset('assets/svg/drawer.svg'),
                                  onTap: () {
                                    homeScaffoldKey.currentState!
                                        .openEndDrawer();
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.37,
                            child: cont.topList.isEmpty
                                ? Image.asset(
                                    'assets/gif/loding.gif',
                                  )
                                : CarouselSlider.builder(
                                    itemCount: cont.topList.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return TopPicksitemWidget(
                                        bookModel: cont.topList[index],
                                      );
                                    },
                                    options: CarouselOptions(
                                        autoPlay: false,
                                        initialPage: 1,
                                        enlargeStrategy:
                                            CenterPageEnlargeStrategy.scale,
                                        pageSnapping: false,
                                        height: Get.height * 0.6,
                                        viewportFraction: 0.45,
                                        enableInfiniteScroll: false,
                                        enlargeCenterPage: true)),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Bestsellers',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 0.4,
                    child: cont.bestList.isEmpty
                        ? Image.asset(
                            'assets/gif/loding.gif',
                            height: 50,
                            width: 50,
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cont.bestList.length,
                            itemBuilder: (context, index) {
                              return BestSellersitemWidget(
                                bookModel: cont.bestList[index],
                              );
                            },
                          ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Genres',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 201 / Get.height,
                    child: cont.geners.isEmpty
                        ? Center(
                            child: Image.asset(
                              'assets/gif/loding.gif',
                              height: 50,
                              width: 50,
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                      () =>
                                          GenreView(genre: cont.geners[index]),
                                      transition: Transition.rightToLeft);
                                },
                                child: ExploreGenereItemWidget(
                                  color: cont.genereColors[index],
                                  genere: cont.geners[index],
                                ),
                              );
                            },
                          ),
                  ),
                ],
              )),
            ));
  }
}
